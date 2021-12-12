import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media/social_app/modules/register_screen/cubit/cubit.dart';
import 'package:media/social_app/modules/register_screen/cubit/states.dart';
import 'package:media/social_app/shared/component/components.dart';
import 'package:media/social_app/shared/component/text_form.dart';
import 'package:media/social_app/shared/constant.dart';

class RegisterScreen extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SocialRegisterCubit(),
      child: BlocConsumer<SocialRegisterCubit, SocialRegisterStates>(
        listener: (context, state) {},
        builder: (context, state) {
          SocialRegisterCubit cubit = SocialRegisterCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Let\'s Get Started !',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                    const Text(
                      'Create an account to get all features',
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w700),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextForm(
                              controller: _nameController,
                              textType: TextInputType.name,
                              validator: (value) => validate(value.toString()),
                              label: 'name',
                              prefix: Icons.person_outline,
                            ),
                            const SizedBox(height: 20),
                            TextForm(
                              controller: _emailController,
                              textType: TextInputType.emailAddress,
                              pressed: () {},
                              validator: (value) => validate(value.toString()),
                              label: 'Email Address',
                              prefix: Icons.email_outlined,
                            ),
                            const SizedBox(height: 20),
                            TextForm(
                              controller: _phoneController,
                              textType: TextInputType.phone,
                              pressed: () {},
                              validator: (value) => validate(value.toString()),
                              label: 'Phone',
                              prefix: Icons.phone_android_rounded,
                            ),
                            const SizedBox(height: 20),
                            TextForm(
                              controller: _passwordController,
                              textType: TextInputType.visiblePassword,
                              //pressed: () => cubit.passShow(),
                              validator: (value) => validate(value.toString()),
                              label: 'Password',
                              //password: cubit.isPassShow,
                              //suffix: cubit.iconData,
                              prefix: Icons.lock_outline,
                            ),
                            const SizedBox(height: 20),
                            TextForm(
                              controller: _confirmPasswordController,
                              textType: TextInputType.visiblePassword,
                              // pressed: () => cubit.passShow(),
                              // password: cubit.isPassShow,
                              validator: (value) => validate(value.toString()),
                              label: 'Confirm password',
                              //suffix: cubit.iconData,
                              prefix: Icons.lock_outline,
                            ),
                          ],
                        ),
                      ),
                    ),
                    ConditionalBuilder(
                      condition: true,
                      builder: (context) =>
                          DefaultButton(
                            title: 'Create',
                            color: defaultColor,
                            pressed: () {
                              cubit.userRegister(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                  phone: _phoneController.text,
                                  name: _nameController.text);
                            },
                            shadowColor: Colors.green,
                          ),
                      fallback: (context) =>
                      const Center(child: CircularProgressIndicator()),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
