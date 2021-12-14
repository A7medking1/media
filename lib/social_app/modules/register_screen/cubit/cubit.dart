import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media/social_app/models/user_model.dart';
import 'package:media/social_app/modules/register_screen/cubit/states.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SocialRegisterCubit extends Cubit<SocialRegisterStates> {
  SocialRegisterCubit() : super(SocialRegisterInitialState());

  static SocialRegisterCubit get(context) => BlocProvider.of(context);

  //ShopLoginModel? shopRegisterModel ;

  void userRegister({
    required String email,
    required String password,
    required String phone,
    required String name,
  }) {
    emit(SocialRegisterLoadingState());

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      print(value.user!.email);
      print(value.user!.uid);

      createUser(
        email: email,
        phone: phone,
        name: name,

        uid: value.user!.uid,
      );


    }).catchError((error) {
      emit(SocialRegisterErrorState(error.toString()));
    });
  }

  void createUser({
    required String email,
    required String phone,
    required String name,
    required String uid,
  }) {
    UserModel model = UserModel(
      email: email,
      name: name,
      phone: phone,
      bio: 'write your bio',
      image: 'https://image.freepik.com/free-photo/handsome-stylish-male-entrepreneur-glasses-with-laptop_176420-17912.jpg',
      cover: 'https://image.freepik.com/free-photo/handsome-stylish-male-entrepreneur-glasses-with-laptop_176420-17912.jpg',
      uid: uid,
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .set(
          model.toMap(),
        )
        .then((value) {
      emit(SocialCreateUserSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SocialCreateUserErrorState(error.toString()));
    });
  }


  //  ***************************************
  bool isPassShow = true;
  IconData iconData = Icons.visibility;

  void passShow() {
    isPassShow = !isPassShow;
    isPassShow ? iconData = Icons.visibility : iconData = Icons.visibility_off;
    emit(SocialRegisterPassShowState());
  }
}
