import 'package:ecommerce/commons/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';

class POrderListItems extends StatelessWidget {
  const POrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = PHelperFunctions.isDarkMode(context);

    return ListView.separated(
      shrinkWrap: true,
      itemCount: 3,
      separatorBuilder: (_, __) => const SizedBox(
        height: PSizes.spaceBtwItems,
      ),
      itemBuilder: (_, index) => PRoundedContainer(
        padding: const EdgeInsets.all(PSizes.md),
        showBorder: true,
        backgroundColor: dark ? PColors.dark : PColors.light,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ///Row 1
            Row(
              children: [
                /// 1-Icon
                const Icon(Iconsax.ship),
                const SizedBox(
                  width: PSizes.spaceBtwItems / 2,
                ),

                ///2 - Status & Date
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Processing',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .apply(color: PColors.primary, fontWeightDelta: 1),
                      ),
                      Text(
                        '22 APR 2024',
                        style: Theme.of(context).textTheme.headlineSmall,
                      )
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Iconsax.arrow_right_34,
                      size: PSizes.iconSm,
                    ))
              ],
            ),
            const SizedBox(
              height: PSizes.spaceBtwItems,
            ),

            ///Row2
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      /// 1-Icon
                      const Icon(Iconsax.tag),
                      const SizedBox(
                        width: PSizes.spaceBtwItems / 2,
                      ),

                      ///2 - Status & Date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Order',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            Text(
                              '[256F2]',
                              style: Theme.of(context).textTheme.titleMedium,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: Row(
                  children: [
                    /// 1-Icon
                    const Icon(Iconsax.ship),
                    const SizedBox(
                      width: PSizes.spaceBtwItems / 2,
                    ),

                    ///2 - Status & Date
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Shipping Date',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          Text(
                            '24-Feb-2024',
                            style: Theme.of(context).textTheme.titleMedium,
                          )
                        ],
                      ),
                    ),
                  ],
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
