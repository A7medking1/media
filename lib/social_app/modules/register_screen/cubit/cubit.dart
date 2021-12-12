import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media/social_app/modules/register_screen/cubit/states.dart';

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
    emit(ShopRegisterLoadingState());

    FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    ).then((value)
    {
      print(value.user!.email);
      print(value.user!.uid);
      emit(ShopRegisterSuccessState());
    }).catchError((error)
    {
      emit(ShopRegisterErrorState(error.toString()));
    });
  }

  //  ***************************************
  bool isPassShow = true;
  IconData iconData = Icons.visibility;

  void passShow() {
    isPassShow = !isPassShow;
    isPassShow ? iconData = Icons.visibility : iconData = Icons.visibility_off;
    emit(ShopRegisterPassShowState());
  }
}
