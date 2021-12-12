
abstract class SocialRegisterStates {}

class SocialRegisterInitialState extends SocialRegisterStates {}
class ShopRegisterPassShowState extends SocialRegisterStates {}
class ShopRegisterLoadingState extends SocialRegisterStates {}
class ShopRegisterSuccessState extends SocialRegisterStates {}
class ShopRegisterErrorState extends SocialRegisterStates
{
  final String error;

  ShopRegisterErrorState(this.error);
}

