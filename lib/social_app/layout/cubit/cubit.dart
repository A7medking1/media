import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media/social_app/layout/cubit/states.dart';


class AppCubit extends Cubit<AppStates>
{
  AppCubit() : super(ShopAppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  // //***** Bottom Nav Bar *********
  //
  // int currentIndex = 0;
  //
  // void changeIndex(int index)
  // {
  //   currentIndex = index;
  //
  //   if(index == 2) getFavorite();
  //   emit(ShopAppChangeBottomState());
  // }
  //
  // List<Widget> screens =
  // [
  //   ShopHomeScreen(),
  //   ShopCategoryScreen(),
  //   const ShopFavoriteScreen(),
  //   ShopCartScreen(),
  // ];
  //
  // // *******************************
  //
  // HomeModel? homeModel;
  // Map<int, bool> favorites = {};
  //
  // void getHomeData()
  // {
  //   emit(ShopLoadingHomeDataState());
  //
  //    DioHelper.getData(
  //     uri: HOME,
  //     token: token,
  //   ).then((value) {
  //     homeModel = HomeModel.fromJson(value.data);
  //
  //     print(homeModel!.data!.products[0].image);
  //     homeModel!.data!.products.forEach((element) {
  //       favorites.addAll({
  //         element.id!: element.inFavorites!,
  //       });
  //     });
  //
  //     // print(favorites.toString());
  //
  //     // print(homeModel!.data!.products[1].name);
  //     // print(homeModel!.data!.products[4].price);
  //     // print(homeModel!.data!.products[0].id);
  //
  //     emit(ShopSuccessHomeDataState());
  //   }).catchError((error) {
  //     print(error.toString());
  //     emit(ShopErrorHomeDataState(error.toString()));
  //   });
  // }
  //
  // // *********************************
  //
  // CategoriesModel? categoriesModel;
  //
  // void getCategoriesData()  {
  //   emit(ShopLoadingCategoriesState());
  //
  //    DioHelper.getData(
  //     uri: CATEGORIES,
  //     token: token,
  //   ).then((value) {
  //     categoriesModel = CategoriesModel.fromJson(value.data);
  //
  //     // print(homeModel!.data!.products[1].name);
  //     // print(homeModel!.data!.products[4].price);
  //     // print(homeModel!.data!.products[0].id);
  //
  //     emit(ShopSuccessCategoriesState());
  //   }).catchError((error) {
  //     print(error.toString());
  //     emit(ShopErrorCategoriesState(error.toString()));
  //   });
  // }
  //
  // // ***************************
  //
  // ChangeFavoritesModel? changeFavoritesModel;
  //
  // void changeFavorite(int productId) {
  //   favorites[productId] = !favorites[productId]!;
  //
  //   emit(ShopLoadingChangeFavoriteState());
  //
  //   DioHelper.postData(
  //     uri: FAVORITES,
  //     token: token,
  //     data: {
  //       'product_id': productId,
  //     },
  //   ).then((value)
  //   {
  //     changeFavoritesModel = ChangeFavoritesModel.fromJson(value.data);
  //
  //     // print(changeFavoritesModel!.message);
  //
  //     if (!changeFavoritesModel!.status!)
  //     {
  //       favorites[productId] = !favorites[productId]!;
  //     } else
  //       {
  //         getFavorite();
  //       }
  //
  //     emit(ShopSuccessChangeFavoriteState(changeFavoritesModel!));
  //   }).catchError((error)
  //   {
  //     favorites[productId] = !favorites[productId]!;
  //     print(error.toString());
  //     emit(ShopErrorChangeFavoriteState(error.toString()));
  //   });
  // }
  //
  // // *******************************
  //
  // FavoritesModel? favoritesModel;
  //
  // void getFavorite()
  // {
  //   emit(ShopLoadingFavoriteState());
  //
  //    DioHelper.getData(
  //     uri: FAVORITES,
  //     token: token,
  //   ).then((value) {
  //     favoritesModel = FavoritesModel.fromJson(value.data);
  //
  //     // print(favoritesModel!.status!);
  //     // print(favoritesModel!.data!.data[0].product!.name!);
  //     // print(favoritesModel!.status!);
  //
  //     emit(ShopSuccessFavoriteState());
  //   }).catchError((error) {
  //     print(error.toString());
  //     emit(ShopErrorFavoriteState(error.toString()));
  //   });
  // }

  //******************************
}

