import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media/social_app/layout/cubit/cubit.dart';
import 'package:media/social_app/layout/social_layout.dart';
import 'package:media/social_app/modules/login_screen/login_screen.dart';
import 'package:media/social_app/shared/constant.dart';
import 'package:media/social_app/shared/network/bloc_observe.dart';
import 'package:media/social_app/shared/themes/theme.dart';
import 'social_app/shared/network/cache_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  // DioHelper.init();

  uId = CacheHelper.getData(key: 'uid');

  Widget widget;

  if (uId != null) {
    widget = SocialLayOut();
  } else {
    widget = SocialLoginScreen();
  }

  runApp(MyApp(
    startScreen: widget,
  ));
}

class MyApp extends StatelessWidget {
  Widget? startScreen;

  MyApp({Key? key, required this.startScreen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppCubit()..getUserData(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme(),
        home: startScreen,
      ),
    );
  }
}
