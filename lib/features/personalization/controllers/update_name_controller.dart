import 'package:ecommerce/data/repositories/user/user_repository.dart';
import 'package:ecommerce/features/personalization/controllers/user_controller.dart';
import 'package:ecommerce/features/personalization/screens/profile/profile.dart';
import 'package:ecommerce/utils/constants/image_strings.dart';
import 'package:ecommerce/utils/helpers/network_manager.dart';
import 'package:ecommerce/utils/popups/full_screen_loader.dart';
import 'package:ecommerce/utils/popups/loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

//Controller to manage user-related functionality.
class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  ///init user data when Home Screen appears
  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  ///Fetch user record
  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstname;
    lastName.text = userController.user.value.lastname;
  }

  Future<void> updateUserName() async {
    try {
      //start loading
      PFullScreenLoader.openLoadingDialog(
          'We are updating your information', PImages.loadingShah);

      //Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        PFullScreenLoader.stopLoading();
        return;
      }

      //Form Validation
      if (!updateUserNameFormKey.currentState!.validate()) {
        PFullScreenLoader.stopLoading();
        return;
      }

      //Update user's firstname and lastname in the firebase store
      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim()
      };
      await userRepository.updateSingleField(name);

      //Update the Rx User Value
      userController.user.value.firstname = firstName.text.trim();
      userController.user.value.lastname = lastName.text.trim();

      //Remove Loader
      PFullScreenLoader.stopLoading();

      //Show Success Message
      PLoader.successSnackBar(
          title: 'Congratulations', message: 'Your name has been updated ');

      //Move to previous Screen
      Get.off(() => const ProfileScreen());
    } catch (e) {
      PFullScreenLoader.stopLoading();
      PLoader.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
