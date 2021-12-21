
abstract class AppStates {}

class AppInitialState extends AppStates {}
class AppGetUserSuccessState extends AppStates
{

}
class AppGetUserLoadingState extends AppStates {}
class AppGetUserErrorState extends AppStates
{
  final String? error;

  AppGetUserErrorState(this.error);
}

// ***************

class AppBottomNavBarState extends AppStates {}
class AppBottomNavBarPostsState extends AppStates {}

 // ************************


class AppGetProfileImageSuccessState extends AppStates {}
class AppGetProfileImageErrorState extends AppStates {}


class AppGetCoverImageSuccessState extends AppStates {}
class AppGetCoverImageErrorState extends AppStates {}

// **************************

class AppUploadCoverImageSuccessState extends AppStates {}
class AppUploadCoverImageErrorState extends AppStates {}

class AppUploadProfileImageSuccessState extends AppStates {}
class AppUploadProfileImageErrorState extends AppStates {}


class AppUserUpdateErrorState extends AppStates {}
class AppUserUpdateLoadingState extends AppStates {}
class AppUserUpdateCoverLoadingState extends AppStates {}



 //*******************************


