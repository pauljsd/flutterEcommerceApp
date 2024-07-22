import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../commons/widgets/loaders/animation_loader.dart';
import '../constants/colors.dart';

/// A Utility class for managing a full-screen loading dialog
class PFullScreenLoader {
  ///Open a full-screen loading dialog with a given text and animation
  ///This method does'nt return anything

  ///Parameters:
  /// - text: The text to be displayed in the loading dialog
  ///  - animation: The lottie animation to be shown

  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!, //Use Get.overlayContent to overlay dialogs
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false, // Disable Popping with the back Button
        child: Container(
          color: PHelperFunctions.isDarkMode(Get.context!)
              ? PColors.dark
              : PColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(
                height: 250,
              ),
              PAnimationLoaderWidget(
                text: text,
                animation: animation,
                showAction: false,
                actionText: '',
              )
            ],
          ),
        ),
      ),
    );
  }

  //Stop the currently open loading dialog
//The method doesn't return anything

  static stopLoading() {
    Navigator.of(Get.overlayContext!)
        .pop(); //Close the dialog using the Navigator
  }
}
