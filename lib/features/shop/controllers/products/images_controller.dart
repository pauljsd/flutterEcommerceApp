import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageController extends GetxController {
  static ImageController get instance => Get.find();

  ///Variable
  RxString selectedProductImage = ''.obs;

  ///Get all Images from Product and Variations
  List<String> getAllProductImages(ProductModel product) {
    //Use Set to add unique image only
    Set<String> images = {};

    //load thumbnail image
    images.add(product.thumbnail);

    //Assign thumbnail as Selected Image
    selectedProductImage.value = product.thumbnail;

    //Get all images from the Product Model if not null
    if (product.images != null) {
      images.addAll(product.images!);
    }

    //Get all images from the product variation  if not null
    if (product.productVariation != null ||
        product.productVariation!.isNotEmpty) {
      images.addAll(
          product.productVariation!.map((variation) => variation.image));
    }
    return images.toList();
  }

  /// Show Image Popup
  void showEnlargedImage(String image) {
    Get.to(
        fullscreenDialog: true,
        () => Dialog.fullscreen(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: PSizes.defaultSpace * 2,
                        horizontal: PSizes.defaultSpace),
                    child: CachedNetworkImage(
                      imageUrl: image,
                    ),
                  ),
                  const SizedBox(
                    height: PSizes.spaceBtwSections,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: 150,
                      child: OutlinedButton(
                          onPressed: () => Get.back(),
                          child: const Text('Close')),
                    ),
                  )
                ],
              ),
            ));
  }
}
