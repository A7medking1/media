import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media/social_app/layout/cubit/cubit.dart';
import 'package:media/social_app/layout/cubit/states.dart';
import 'package:media/social_app/modules/edit_profile_screen/edit_profile_screen.dart';
import 'package:media/social_app/modules/privacy_screen/privacy_screen.dart';
import 'package:media/social_app/shared/component/components.dart';
import 'package:media/social_app/shared/component/icon_broken.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var userModel = AppCubit.get(context).userModel;
        return ConditionalBuilder(
          condition: userModel != null,
          builder: (context) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 200,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Align(
                        alignment: AlignmentDirectional.topCenter,
                        child: Container(
                          width: double.infinity,
                          height: 170,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            image: DecorationImage(
                              image: NetworkImage('${userModel!.cover}'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      CircleAvatar(
                        radius: 60.0,
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        child: CircleAvatar(
                          radius: 55.0,
                          backgroundImage: NetworkImage('${userModel.image}'),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '${userModel.name}',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '${userModel.bio}',
                  style: Theme.of(context).textTheme.caption,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Row(
                    children: [
                      BuildCountPosts(
                        onTap: () {},
                        count: '100',
                        name: 'Posts',
                      ),
                      BuildCountPosts(
                        onTap: () {},
                        count: '100',
                        name: 'Posts',
                      ),
                      BuildCountPosts(
                        onTap: () {},
                        count: '100',
                        name: 'Posts',
                      ),
                      BuildCountPosts(
                        onTap: () {},
                        count: '100',
                        name: 'Posts',
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        child: const Text(
                          'Add Photos',
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    OutlinedButton(
                      onPressed: () {
                        navigateTO(context, EditProfileScreen());
                      },
                      child: const Icon(
                        IconBroken.Edit,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    OutlinedButton(
                      onPressed: () {
                        navigateTO(context, PrivacyScreen());
                      },
                      child: const Icon(
                        IconBroken.Setting,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          fallback: (context) =>
              const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}

class BuildCountPosts extends StatelessWidget {
  const BuildCountPosts({
    Key? key,
    required this.onTap,
    required this.count,
    required this.name,
  }) : super(key: key);

  final void Function()? onTap;
  final String count;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        child: Column(
          children: [
            Text(
              count.toString(),
              style: Theme.of(context).textTheme.subtitle2,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              name.toString(),
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}
