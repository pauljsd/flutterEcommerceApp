import 'package:ecommerce/commons/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommerce/commons/widgets/texts/product_price_text.dart';
import 'package:ecommerce/commons/widgets/texts/product_title_text.dart';
import 'package:ecommerce/features/shop/controllers/variation_controller.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../commons/widgets/choicechip/choice_chip.dart';
import '../../../../../commons/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class PProductAttributes extends StatelessWidget {
  const PProductAttributes({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VariationController());
    final dark = PHelperFunctions.isDarkMode(context);

    return Obx(
      () => Column(
        children: [
          // -- Selected Attribute and Description
          // -- Display Variation price and stock when some variation is selected
          if (controller.selectedVariation.value.id.isNotEmpty)
            PRoundedContainer(
              padding: const EdgeInsets.all(PSizes.md),
              backgroundColor: dark ? PColors.darkerGrey : PColors.grey,
              child: Column(
                //Title, Price and Stock stack
                children: [
                  Row(
                    children: [
                      const PSectionHeading(
                        title: 'Variation',
                        showActionButton: false,
                      ),
                      const SizedBox(
                        width: PSizes.spaceBtwItems,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const PProductTitleText(
                                title: 'Price : ',
                                smallSize: true,
                              ),
                              Row(
                                children: [
                                  //Actual Price
                                  if (controller
                                          .selectedVariation.value.salePrice >
                                      0)
                                    Text(
                                      '\$${controller.selectedVariation.value.price}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .apply(
                                              decoration:
                                                  TextDecoration.lineThrough),
                                    ),
                                  const SizedBox(
                                    width: PSizes.spaceBtwItems,
                                  ),

                                  ///Sales Price
                                  PProductPriceText(
                                      price: controller.getVariationPrice()),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const PProductTitleText(
                                title: 'Stock : ',
                                smallSize: true,
                              ),
                              Text(
                                controller.variationStockStatus.value,
                                style: Theme.of(context).textTheme.titleMedium,
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),

                  ///Variation Description
                  PProductTitleText(
                    title: controller.variationStockStatus.value,
                    smallSize: true,
                    maxLine: 4,
                  )
                ],
              ),
            ),
          const SizedBox(
            height: PSizes.spaceBtwItems,
          ),

          ///Attributes
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: product.productAttributes!
                .map((attribute) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PSectionHeading(
                          title: attribute.name ?? '',
                          showActionButton: false,
                        ),
                        const SizedBox(
                          height: PSizes.spaceBtwItems / 2,
                        ),
                        Obx(
                          () => Wrap(
                              spacing: 8,
                              children: attribute.values!.map((attributeValue) {
                                final isSelected = controller
                                        .selectedAttributes[attribute.name] ==
                                    attributeValue;
                                final available = controller
                                    .getAttributesAvailabilityVariation(
                                        product.productVariation!,
                                        attribute.name!)
                                    .contains(attributeValue);
                                return PChoiceChip(
                                    text: attributeValue,
                                    selected: isSelected,
                                    onSelected: available
                                        ? (selected) {
                                            if (selected && available) {
                                              controller.onAttributeSelected(
                                                  product,
                                                  attribute.name ?? '',
                                                  attributeValue);
                                            }
                                          }
                                        : null);
                              }).toList()),
                        )
                      ],
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}
