import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:media/social_app/layout/cubit/states.dart';
import 'package:media/social_app/models/user_model.dart';
import 'package:media/social_app/modules/chat_screen/chat_screen.dart';
import 'package:media/social_app/modules/home_screen/home_screen.dart';
import 'package:media/social_app/modules/new_posts/new_posts.dart';
import 'package:media/social_app/modules/settings_screen/settings_screen.dart';
import 'package:media/social_app/modules/user_screen/user_screen.dart';
import 'package:media/social_app/shared/constant.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  UserModel? userModel;

  void getUserData() {
    emit(AppGetUserLoadingState());
    FirebaseFirestore.instance.collection('users').doc(uId).get().then(
      (value) {
        //print(value.data());
        userModel = UserModel.fromJson(value.data()!);
        uId = userModel!.uid;
        //print("this uid => $uId");
        debugPrint('this is AppCubit cubit  => $uId');
        // debugPrint(userModel!.name);
        // debugPrint(userModel!.phone);
        emit(AppGetUserSuccessState());
      },
    ).catchError((error) {
      debugPrint(error.toString());
      emit(AppGetUserErrorState(error.toString()));
    });
  }

  File? profileImage;

  var picker = ImagePicker();

  Future getProfileImage() async {
    final pickFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickFile != null) {
      profileImage = File(pickFile.path);
      emit(AppGetProfileImageSuccessState());
    } else {
      emit(AppGetProfileImageErrorState());
      debugPrint('No Image Selected');
    }
  }

  File? coverImage;

  Future getCoverImage() async {
    final pickFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickFile != null) {
      coverImage = File(pickFile.path);
      emit(AppGetCoverImageSuccessState());
    } else {
      emit(AppGetCoverImageErrorState());
      debugPrint('No Image Selected');
    }
  }

  void uploadProfileImage({
    required String name,
    required String phone,
    required String bio,
  }) async {
    emit(AppUserUpdateLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profileImage!.path).pathSegments.last}')
        .putFile(profileImage!)
        .then((value) => {
              value.ref.getDownloadURL().then((value) {
                updateUser(
                  name: name,
                  phone: phone,
                  bio: bio,
                  image: value,
                );
                //emit(AppUploadProfileImageSuccessState()); // 2020
                debugPrint(value);
              }).catchError((error) {
                emit(AppUploadProfileImageErrorState());
              })
            })
        .catchError((error) {
      emit(AppUploadProfileImageErrorState());
    });
  }

  void uploadCoverImage({
    required String name,
    required String phone,
    required String bio,
  }) async {
    //
    emit(AppUserUpdateLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(coverImage!.path).pathSegments.last}')
        .putFile(coverImage!)
        .then((value) => {
              value.ref.getDownloadURL().then((value) {
                updateUser(
                  name: name,
                  phone: phone,
                  bio: bio,
                  cover: value,
                );
                if (profileImage != null) {
                  uploadProfileImage(
                    name: name,
                    phone: phone,
                    bio: bio,
                  );
                }
                debugPrint(value);
              }).catchError((error) {
                emit(AppUploadCoverImageErrorState());
              })
            })
        .catchError((error) {
      emit(AppUploadCoverImageErrorState());
    });
  }

  void updateUserImages({
    required String name,
    required String phone,
    required String bio,
  }) async {
    emit(AppUserUpdateLoadingState());
    if (coverImage != null) {
      uploadCoverImage(
        name: name,
        phone: phone,
        bio: bio,
      );
    } else if (profileImage != null) {
      uploadProfileImage(
        name: name,
        phone: phone,
        bio: bio,
      );
    } else {
      uploadCoverImage(
        name: name,
        phone: phone,
        bio: bio,
      );
    }
  }

  void updateUser({
    required String name,
    required String phone,
    required String bio,
    String? cover,
    String? image,
  }) {
    UserModel model = UserModel(
      name: name,
      phone: phone,
      bio: bio,
      email: userModel!.email,
      image: image ?? userModel!.image,
      uid: userModel!.uid,
      cover: cover ?? userModel!.cover,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel!.uid)
        .update(model.toMap())
        .then((value) {
      getUserData();
    }).catchError((error) {
      emit(AppUserUpdateErrorState());
    });
  }

  // ********************

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  int currentIndex = 0;

  void changeIndex(int index) {
    if (index == 2) {
      emit(AppBottomNavBarPostsState());
    } else {
      currentIndex = index;
      emit(AppBottomNavBarState());
    }
  }

  List<Widget> screens = [
    const HomeScreen(),
    const ChatScreen(),
    const NewPostsScreen(),
    const UserScreen(),
    const SettingScreen(),
  ];

  List<String> title = [
    'New Feed',
    'Chat',
    'Posts',
    'User Screen',
    'Settings',
  ];
}
