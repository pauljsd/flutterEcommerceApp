import 'package:ecommerce/commons/widgets/shimmers/shimmer.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';

class PCategoryShimmer extends StatelessWidget {
  const PCategoryShimmer({super.key, this.itemCount = 6});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (_, __) => const SizedBox(
                width: PSizes.spaceBtwItems,
              ),
          itemCount: itemCount,
          itemBuilder: (_, __) {
            return const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///Image
                PShimmerEffect(
                  width: 55,
                  height: 55,
                  radius: 55,
                ),
                SizedBox(
                  height: PSizes.spaceBtwItems / 2,
                ),

                ///Text
                PShimmerEffect(width: 55, height: 8),
              ],
            );
          }),
    );
  }
}
