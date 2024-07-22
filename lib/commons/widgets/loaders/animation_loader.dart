import 'package:ecommerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/constants/sizes.dart';

//A widget for displaying an animated indicator with optimal text and action button
class PAnimationLoaderWidget extends StatelessWidget {
  //Default constructor for the PAnimationWidget

  //Parameter:
  //text: to be dispalyed below the animation
  //animation: the path to the lottie animation file
  //showAction: whether to show an animation button below the text
  //actiontext: the text to be displayed on the action button
  //onActionPressed: callBack function to be executed when the action button is pressed

  const PAnimationLoaderWidget(
      {super.key,
      required this.text,
      required this.animation,
      required this.showAction,
      required this.actionText,
      this.onActionPressed});

  final String text;
  final String animation;
  final bool showAction;
  final String actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(animation,
              width: MediaQuery.of(context).size.width *
                  0.8), //Display Lottie animation
          const SizedBox(
            height: PSizes.defaultSpace,
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: PSizes.defaultSpace,
          ),
          showAction
              ? SizedBox(
                  width: 250,
                  child: OutlinedButton(
                    onPressed: onActionPressed,
                    style:
                        OutlinedButton.styleFrom(backgroundColor: PColors.dark),
                    child: Text(
                      actionText,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .apply(color: PColors.light),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
