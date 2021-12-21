import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media/social_app/layout/cubit/cubit.dart';
import 'package:media/social_app/layout/cubit/states.dart';
import 'package:media/social_app/shared/component/components.dart';
import 'package:media/social_app/shared/component/icon_broken.dart';
import 'package:media/social_app/shared/component/text_form.dart';

class PrivacyScreen extends StatelessWidget {
  final nameController = TextEditingController();
  final bioController = TextEditingController();
  final phoneController = TextEditingController();

  PrivacyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is AppGetUserSuccessState) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        var userModel = AppCubit.get(context).userModel;

        nameController.text = userModel!.name!;
        phoneController.text = userModel.phone!;
        bioController.text = userModel.bio!;

        return Scaffold(
          appBar:
              defaultAppBar(context: context, title: 'Edit profile', actions: [
            DefaultTextButton(
              title: 'Update',
              pressed: () {
                AppCubit.get(context).updateUser(
                  name: nameController.text,
                  phone: phoneController.text,
                  bio: bioController.text,
                );
              },
            ),
            const SizedBox(
              width: 15,
            ),
          ]),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  if (state is AppUserUpdateLoadingState)
                    const LinearProgressIndicator(),
                  if (state is AppUserUpdateLoadingState)
                    const SizedBox(
                      height: 15,
                    ),
                  // SizedBox(
                  //   height: 200,
                  //   child: Stack(
                  //     alignment: AlignmentDirectional.bottomCenter,
                  //     children: [
                  //       Align(
                  //         alignment: AlignmentDirectional.topCenter,
                  //         child: Stack(
                  //           alignment: AlignmentDirectional.topEnd,
                  //           children: [
                  //             ConditionalBuilder(
                  //               condition: coverImage == null,
                  //               builder: (context) => Container(
                  //                 width: double.infinity,
                  //                 height: 170,
                  //                 decoration: BoxDecoration(
                  //                   borderRadius: const BorderRadius.only(
                  //                     topLeft: Radius.circular(10),
                  //                     topRight: Radius.circular(10),
                  //                   ),
                  //                   image: DecorationImage(
                  //                     image: NetworkImage('${userModel.cover}'),
                  //                     fit: BoxFit.cover,
                  //                   ),
                  //                 ),
                  //               ),
                  //               fallback: (context) => Container(
                  //                 width: double.infinity,
                  //                 height: 170,
                  //                 decoration: BoxDecoration(
                  //                   borderRadius: const BorderRadius.only(
                  //                     topLeft: Radius.circular(10),
                  //                     topRight: Radius.circular(10),
                  //                   ),
                  //                   image: DecorationImage(
                  //                     image: FileImage(coverImage!),
                  //                     fit: BoxFit.cover,
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  //             IconButton(
                  //               onPressed: () =>
                  //                   AppCubit.get(context).getCoverImage(),
                  //               icon: const CircleAvatar(
                  //                 radius: 20.0,
                  //                 child: Icon(
                  //                   IconBroken.Camera,
                  //                 ),
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //       Stack(
                  //         alignment: AlignmentDirectional.bottomEnd,
                  //         children: [
                  //           CircleAvatar(
                  //             radius: 60.0,
                  //             backgroundColor:
                  //                 Theme.of(context).scaffoldBackgroundColor,
                  //             child: ConditionalBuilder(
                  //               condition: profileImage == null,
                  //               builder: (context) => CircleAvatar(
                  //                 radius: 55.0,
                  //                 backgroundImage:
                  //                     NetworkImage('${userModel.image}'),
                  //               ),
                  //               fallback: (context) => CircleAvatar(
                  //                 radius: 55.0,
                  //                 backgroundImage: FileImage(profileImage!),
                  //               ),
                  //             ),
                  //           ),
                  //           IconButton(
                  //             onPressed: () =>
                  //                 AppCubit.get(context).getProfileImage(),
                  //             icon: const CircleAvatar(
                  //               radius: 20.0,
                  //               child: Icon(
                  //                 IconBroken.Camera,
                  //               ),
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  const SizedBox(),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  // if (AppCubit.get(context).profileImage != null ||
                  //     AppCubit.get(context).coverImage != null)
                  //   Row(
                  //     children: [
                  //       if (AppCubit.get(context).profileImage != null)
                  //         Expanded(
                  //           child: Column(
                  //             children: [
                  //               // hide button after update
                  //                 DefaultButton(
                  //                 title: 'Update Profile',
                  //                 pressed: () {
                  //                   AppCubit.get(context).uploadProfileImage(
                  //                     name: nameController.text,
                  //                     phone: phoneController.text,
                  //                     bio: bioController.text,
                  //                   );
                  //                   //AppCubit.get(context).profileImage = null ;
                  //                 },
                  //               ),
                  //               if (state is AppUserUpdateLoadingState)
                  //                 const SizedBox(
                  //                 height: 10,
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       const SizedBox(
                  //         width: 10,
                  //       ),
                  //       if (AppCubit.get(context).coverImage != null)
                  //         Expanded(
                  //           child: Column(
                  //             children: [
                  //               // hide button after update
                  //               if(state is! AppGetUserSuccessState)
                  //                 DefaultButton(
                  //                 title: 'Update Cover',
                  //                 pressed: ()
                  //                 {
                  //                   AppCubit.get(context).uploadCoverImage(
                  //                     name: nameController.text,
                  //                     phone: phoneController.text,
                  //                     bio: bioController.text,
                  //                   );
                  //                   //AppCubit.get(context).coverImage = null;
                  //                 },
                  //               ),
                  //               if (state is AppUserUpdateLoadingState)
                  //                 const SizedBox(
                  //                 height: 10,
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //     ],
                  //   ),
                  // if (AppCubit.get(context).profileImage != null ||
                  //     AppCubit.get(context).coverImage != null)
                  //   const SizedBox(
                  //     height: 30,
                  //   ),
                  TextForm(
                    controller: nameController,
                    textType: TextInputType.name,
                    validator: (value) => validate(value!),
                    label: 'Name',
                    prefix: IconBroken.User,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextForm(
                    controller: bioController,
                    textType: TextInputType.text,
                    validator: (value) => validate(value!),
                    label: 'Bio ..',
                    prefix: IconBroken.Info_Circle,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextForm(
                    controller: phoneController,
                    textType: TextInputType.phone,
                    validator: (value) => validate(value!),
                    label: 'Phone',
                    prefix: IconBroken.Call,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
