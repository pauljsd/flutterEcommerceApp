import 'package:ecommerce/commons/widgets/products/rating/rating_indicator.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../../../commons/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = PHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage(PImages.userProfileImage1),
                ),
                const SizedBox(
                  width: PSizes.spaceBtwItems,
                ),
                Text(
                  'Alika Ruth',
                  style: Theme.of(context).textTheme.titleLarge,
                )
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
          ],
        ),
        const SizedBox(
          height: PSizes.spaceBtwItems,
        ),

        ///Reviews
        Row(
          children: [
            const PRatingBarIndicator(rating: 4),
            const SizedBox(
              width: PSizes.spaceBtwItems,
            ),
            Text(
              '12-01-2024',
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
        const SizedBox(
          height: PSizes.spaceBtwItems,
        ),
        const ReadMoreText(
          'This App ehn, e too good. The interface is so nice and to you can navigate with no stress atall',
          trimLines: 1,
          trimMode: TrimMode.Line,
          trimExpandedText: ' show less',
          trimCollapsedText: ' show more',
          moreStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: PColors.primary),
          lessStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: PColors.primary),
        ),
        const SizedBox(
          height: PSizes.spaceBtwItems,
        ),

        ///Company Review
        PRoundedContainer(
          backgroundColor: dark ? PColors.grey : PColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(PSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "SwitChow's Store",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      '13-01-2024',
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                  ],
                ),
                const SizedBox(
                  height: PSizes.spaceBtwItems,
                ),
                const ReadMoreText(
                  'This App ehn, e too good. The interface is so nice and to you can navigate with no stress atall',
                  trimLines: 1,
                  trimMode: TrimMode.Line,
                  trimExpandedText: ' show less',
                  trimCollapsedText: ' show more',
                  moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: PColors.primary),
                  lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: PColors.primary),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: PSizes.spaceBtwItems,
        ),
      ],
    );
  }
}
