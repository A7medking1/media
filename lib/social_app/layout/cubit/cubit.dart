import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media/social_app/layout/cubit/states.dart';
import 'package:media/social_app/models/user_model.dart';
import 'package:media/social_app/modules/chat_screen/chat_screen.dart';
import 'package:media/social_app/modules/home_screen/home_screen.dart';
import 'package:media/social_app/modules/new_posts/new_posts.dart';
import 'package:media/social_app/modules/settings_screen/settings_screen.dart';
import 'package:media/social_app/modules/user_screen/user_screen.dart';
import 'package:media/social_app/shared/constant.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  UserModel? model;

  void getUserData() {

    emit(AppGetUserLoadingState());
    FirebaseFirestore.instance.collection('users').doc(uId).get().then(
      (value)
      {
        //print(value.data());
         model = UserModel.fromJson(value.data()!);

         // print(model!.uid);
         // print(model!.name);
         // print(model!.phone);
        emit(AppGetUserSuccessState());
      },
    ).catchError((error)
    {
      print(error.toString());
      emit(AppGetUserErrorState(error.toString()));
    });
  }



  // ********************

  int currentIndex = 0 ;
  void changeIndex(int index)
  {
    if(index == 2)
    {
      emit(AppBottomNavBarPostsState());
    }else{
      currentIndex = index ;
      emit(AppBottomNavBarState());
    }

  }

  List<Widget> screens =
  [
    HomeScreen(),
    ChatScreen(),
    NewPostsScreen(),
    UserScreen(),
    SettingScreen(),
  ];


  List<String> title =
  [
    'New Feed',
    'Chat',
    'Posts',
    'User Screen',
    'Settings',
  ];

}
