import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media/social_app/modules/login_screen/login_screen.dart';
import 'package:media/social_app/shared/network/bloc_observe.dart';
import 'package:media/social_app/shared/themes/theme.dart';
import 'social_app/shared/network/cache_helper.dart';

void main() async
{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  // DioHelper.init();


  runApp(MyApp());
}

class MyApp extends StatelessWidget
{


  const MyApp({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme(),
      home: SocialLoginScreen(),
    );
  }
}
