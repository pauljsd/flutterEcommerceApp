import 'package:ecommerce/features/authentication/screens/login/login.dart';
import 'package:ecommerce/features/authentication/screens/onboarding/onboarding.dart';
import 'package:ecommerce/features/authentication/screens/password_configuration/forgot_password.dart';
import 'package:ecommerce/features/authentication/screens/signup/signup.dart';
import 'package:ecommerce/features/authentication/screens/signup/verify_email.dart';
import 'package:ecommerce/features/personalization/screens/address/address.dart';
import 'package:ecommerce/features/personalization/screens/profile/profile.dart';
import 'package:ecommerce/features/shop/screens/checkout/checkout.dart';
import 'package:ecommerce/features/shop/screens/home/home.dart';
import 'package:ecommerce/features/shop/screens/order/order.dart';
import 'package:ecommerce/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:ecommerce/features/shop/screens/wishlist/wishlist.dart';
import 'package:ecommerce/routes/routes.dart';
import 'package:get/get.dart';

import '../features/personalization/screens/settings/settings.dart';
import '../features/shop/screens/store/store.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: PRoutes.home, page: () => const HomeScreen()),
    GetPage(name: PRoutes.store, page: () => const StoreScreen()),
    GetPage(name: PRoutes.favourites, page: () => const FavouriteScreen()),
    GetPage(name: PRoutes.settings, page: () => const SettingsScreen()),
    GetPage(
        name: PRoutes.productReviews, page: () => const ProductReviewScreen()),
    GetPage(name: PRoutes.order, page: () => const OrderScreen()),
    GetPage(name: PRoutes.checkout, page: () => const CheckoutScreen()),
    GetPage(name: PRoutes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: PRoutes.userAddress, page: () => const UserAddressScreen()),
    GetPage(name: PRoutes.signup, page: () => const SignUpScreen()),
    GetPage(name: PRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: PRoutes.signIn, page: () => const LoginScreen()),
    GetPage(name: PRoutes.forgotPassword, page: () => const ForgotPassword()),
    GetPage(name: PRoutes.onboarding, page: () => const OnBoardingScreen()),
  ];
}
