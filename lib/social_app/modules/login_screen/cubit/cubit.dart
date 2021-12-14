import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media/social_app/modules/login_screen/cubit/states.dart';

class SocialLoginCubit extends Cubit<SocialLoginStates> {
  SocialLoginCubit() : super(SocialInitialState());

  static SocialLoginCubit get(context) => BlocProvider.of(context);

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(SocialLoginLoadingState());

    FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    ).then((value)
    {
      print(value.user!.email);
      print(value.user!.uid);
      emit(SocialLoginSuccessState(value.user!.uid));
    }).catchError((error)
    {
      emit(SocialLoginErrorState(error.toString()));
    });
  }

  //  ***************************************
  bool isPassShow = true;

  IconData iconData = Icons.visibility;

  void passShow() {
    isPassShow = !isPassShow;
    isPassShow ? iconData = Icons.visibility : iconData = Icons.visibility_off;
    emit(SocialPassShowState());
  }
}
