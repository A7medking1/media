// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:salla/shop_app/layout/cubit/cubit.dart';
// import 'package:salla/shop_app/layout/cubit/states.dart';
// import 'package:salla/shop_app/moduls/drawer_screen/drawer_screen.dart';
// import 'package:salla/shop_app/moduls/login_screen/login_screen.dart';
// import 'package:salla/shop_app/shared/component/components.dart';
// import 'package:salla/shop_app/shared/component/icon_broken.dart';
// import 'package:salla/shop_app/shared/network/cache_helper.dart';
//
// class ShopLayOut extends StatelessWidget {
//   const ShopLayOut({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<ShopAppCubit, ShopAppStates>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         ShopAppCubit cubit = ShopAppCubit.get(context);
//         return Scaffold(
//           appBar: AppBar(
//             title: const Text(
//               'Salla App',
//             ),
//             actions:
//             [
//               IconButton(
//                 onPressed: () {
//                   CacheHelper.removeData(key: 'token').then((value) {
//                     if (value) {
//                       navigatorAndFinish(
//                         context,
//                         ShopLoginScreen(),
//                       );
//                     }
//                   });
//                 },
//                 icon: const Icon(
//                   IconBroken.Chat,
//                 ),
//               ),
//             ],
//           ),
//           body: cubit.screens[cubit.currentIndex],
//           drawer: DrawerWidget(),
//           bottomNavigationBar: BottomNavigationBar(
//             currentIndex: cubit.currentIndex,
//             onTap: (index) => cubit.changeIndex(index),
//             items: const [
//               BottomNavigationBarItem(
//                 icon: Icon(
//                   IconBroken.Home,
//                 ),
//                 label: 'Home',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(
//                   IconBroken.Category,
//                 ),
//                 label: 'Category',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(
//                   IconBroken.Heart,
//                 ),
//                 label: 'Favorite',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(
//                   IconBroken.Buy,
//                 ),
//                 label: 'Cart',
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
//
