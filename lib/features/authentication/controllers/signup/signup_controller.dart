import 'package:ecommerce/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce/features/authentication/screens/signup/verify_email.dart';
import 'package:ecommerce/utils/popups/full_screen_loader.dart';
import 'package:ecommerce/utils/popups/loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/user/user_repository.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../personalization/models/user_model.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  ///Variables
  final hidePassword = true.obs; //observable for hiding or showing password
  final privacyPolicy = true.obs; //privacypolicy
  final email = TextEditingController();
  final lastname = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final firstname = TextEditingController();
  final phoneNumber = TextEditingController();

  GlobalKey<FormState> signupFormKey =
      GlobalKey<FormState>(); // Form key for Form Variable

  ///SignUp
  void signup() async {
    try {
      ///Form Validation
      if (!signupFormKey.currentState!.validate()) {
        //Remove Loader
        // PFullScreenLoader.stopLoading();
        return;
      }

      ///Start Loading
      PFullScreenLoader.openLoadingDialog(
          'We are processing your information', PImages.loadingShah);

      ///Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        //Remove Loader
        PFullScreenLoader.stopLoading();
        return;
      }

      ///Privacy Policy Check
      if (!privacyPolicy.value) {
        PLoader.warningSnackBar(
            title: 'Accept Privacy Policy',
            message:
                'In order to create account, you have to read and accept the Privacy Policy and Term of use');
        PFullScreenLoader.stopLoading();
        return;
      }

      ///Register User in the Firebase Authentication and Save user data in the firebase
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      ///Save Authenticated User data in the Firebase FireStore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstname: firstname.text.trim(),
        lastname: lastname.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
        addresses: [],
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      //Remove Loader
      PFullScreenLoader.stopLoading();

      //show Success Message
      PLoader.successSnackBar(
          title: 'Congratulations',
          message: 'Your account has been created, verify email to continue');

      //Move to verify Email Screen
      Get.to(() => VerifyEmailScreen(
            email: email.text.trim(),
          ));
    } catch (e) {
      /// remove loader
      PFullScreenLoader.stopLoading();
// print(message);
      ///show some generic error to the user
      PLoader.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
