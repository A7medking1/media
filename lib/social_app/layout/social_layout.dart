import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media/social_app/layout/cubit/cubit.dart';
import 'package:media/social_app/layout/cubit/states.dart';
import 'package:media/social_app/modules/login_screen/login_screen.dart';
import 'package:media/social_app/modules/new_posts/new_posts.dart';
import 'package:media/social_app/shared/component/components.dart';
import 'package:media/social_app/shared/component/icon_broken.dart';
import 'package:media/social_app/shared/network/cache_helper.dart';

class SocialLayOut extends StatelessWidget {
  const SocialLayOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is AppBottomNavBarPostsState) {
          navigateTO(context, const NewPostsScreen());
        }
      },
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              cubit.title[cubit.currentIndex],
            ),
            actions: [
              IconButton(
                onPressed: () {
                  cubit.signOut().then((value) {
                    CacheHelper.removeData(key: 'uid').then((value) {
                      if (value) {
                        navigatorAndFinish(context, SocialLoginScreen());
                      }
                    });
                  });
                },
                icon: const Icon(
                  IconBroken.Notification,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  IconBroken.Search,
                ),
              ),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) => cubit.changeIndex(index),
            currentIndex: cubit.currentIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  IconBroken.Home,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  IconBroken.Chat,
                ),
                label: 'Chat',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  IconBroken.Paper_Upload,
                ),
                label: 'Posts',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  IconBroken.Location,
                ),
                label: 'Users',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  IconBroken.Setting,
                ),
                label: 'Setting',
              ),
            ],
          ),
        );
      },
    );
  }
}
