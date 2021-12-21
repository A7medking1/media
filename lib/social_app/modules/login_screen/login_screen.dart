import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media/social_app/layout/cubit/cubit.dart';
import 'package:media/social_app/layout/cubit/states.dart';
import 'package:media/social_app/layout/social_layout.dart';
import 'package:media/social_app/modules/login_screen/cubit/cubit.dart';
import 'package:media/social_app/modules/login_screen/cubit/states.dart';
import 'package:media/social_app/modules/register_screen/register_screen.dart';
import 'package:media/social_app/shared/component/components.dart';
import 'package:media/social_app/shared/component/text_form.dart';
import 'package:media/social_app/shared/constant.dart';
import 'package:media/social_app/shared/network/cache_helper.dart';

class SocialLoginScreen extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  SocialLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(BuildContext context) => SocialLoginCubit(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context, state){},
        builder: (context, state)
        {
          return BlocConsumer<SocialLoginCubit, SocialLoginStates>(
            listener: (context, state) {
              if (state is SocialLoginErrorState) {
                showToastState(
                  text: state.error,
                  state: ToastStates.error,
                  context: context,
                );
              }
              if (state is SocialLoginSuccessState)
              {
                AppCubit.get(context).getUserData();
                debugPrint('this is login screen => $uId');
                CacheHelper.saveData(key: 'uid', value: state.uId,).then((value) {
                  navigatorAndFinish(context, const SocialLayOut());
                });
              }
            },
            builder: (context, state) {
              SocialLoginCubit cubit = SocialLoginCubit.get(context);
              return Scaffold(
                appBar: AppBar(),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        alignment: AlignmentDirectional.center,
                        width: double.infinity,
                        height: 140,
                        // child: const Image(
                        //   image: AssetImage('assets/images/login.png'),
                        // ),
                      ),
                      const Text(
                        'Welcome back!',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        'Log in to your existant account of Q Allure',
                        style: TextStyle(
                            color: Colors.black54, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 320,
                        decoration: BoxDecoration(color: Colors.white, boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 7,
                            offset: const Offset(0, 1),
                          ),
                        ]),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(height: 30),
                                TextForm(
                                  controller: _emailController,
                                  textType: TextInputType.emailAddress,
                                  validator: (value) => validate(value.toString()),
                                  label: 'Email Address',
                                  prefix: Icons.email_outlined,
                                ),
                                const SizedBox(height: 30),
                                TextForm(
                                  controller: _passwordController,
                                  textType: TextInputType.visiblePassword,
                                  // suffix: cubit.iconData,
                                  // password: cubit.isPassShow,
                                  //pressed: () => cubit.passShow(),
                                  validator: (value) => validate(value.toString()),
                                  label: 'Password',
                                  prefix: Icons.lock_outline,
                                ),
                                const SizedBox(height: 30),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            DefaultTextButton(
                              title: 'Forget Password',
                              pressed: () {},
                              fontSize: 14,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ConditionalBuilder(
                        condition: state is! SocialLoginLoadingState,
                        builder: (context) =>
                            DefaultButton(
                              title: 'LOGIN ',
                              color: defaultColor,
                              pressed: () {
                                if (_formKey.currentState!.validate()) {
                                  cubit.userLogin(
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                  );
                                }
                              },
                              shadowColor: Colors.green,
                            ),
                        fallback: (context) =>
                        const Center(child: CircularProgressIndicator()),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              'Don\'t have an account ?',
                              style: TextStyle(
                                // letterSpacing: 3,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            DefaultTextButton(
                              title: 'Register now',
                              pressed: () {
                                navigateTO(context, RegisterScreen());
                              },
                              fontSize: 16,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

