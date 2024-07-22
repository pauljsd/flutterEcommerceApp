import 'package:ecommerce/features/personalization/controllers/user_controller.dart';
import 'package:ecommerce/utils/popups/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/exceptions/platform_exceptions.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';

class LoginController extends GetxController {
// Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  @override
  void onInit() {
    // email.text = '';
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }

  ///-- Email and Password SignIn
  Future<void> emailAndPasswordSignIn() async {
    try {
      // Start Loading
      PFullScreenLoader.openLoadingDialog(
          'Logging you in...', PImages.loadingShah);

// Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        PFullScreenLoader.stopLoading();
        return;
      }
// Form Validation
      if (!loginFormKey.currentState!.validate()) {
        PFullScreenLoader.stopLoading();
        return;
      }
// Save Data if Remember Me is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }
// Login user using EMail & Password Authentication
      final userCredentials = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      //Remove Loader
      PFullScreenLoader.stopLoading();

      //Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      PFullScreenLoader.stopLoading();
      final PPlatformException exception = PPlatformException(e.toString());
      // exception.message;
      print('Error Note');
      print(e.toString());
      // PLoader.errorSnackBar(title: 'Oh Snap', message: e.toString());
      PLoader.errorSnackBar(title: 'Oh Snap', message: exception.message);
    }
  }

  ///Google Sign In Authentication
  Future<void> googleSignIn() async {
    try {
// Start Loading
      PFullScreenLoader.openLoadingDialog(
          'Reaching google...', PImages.loadingShah);

// Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        PFullScreenLoader.stopLoading();
        return;
      }

// Google Authentication
      final userCredentials =
          await AuthenticationRepository.instance.signInWithGoogle();

      //Save User Record
      await userController.saveUserRecord(userCredentials);

      //Remove Loader
      PFullScreenLoader.stopLoading();

      //Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      //Remove Loader
      PFullScreenLoader.stopLoading();
      PLoader.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
