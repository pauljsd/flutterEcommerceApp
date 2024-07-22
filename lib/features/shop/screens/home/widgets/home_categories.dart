import 'package:ecommerce/commons/widgets/shimmers/category_shimmer.dart';
import 'package:ecommerce/features/shop/screens/sub_category/sub_category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../commons/widgets/image_text_widgets/vertical_image_text.dart';
import '../../../controllers/category_controller.dart';

class PHomeCategories extends StatelessWidget {
  const PHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());

    return Obx(() {
      ///While Category is Loading
      if (categoryController.isLoading.value) return const PCategoryShimmer();

      ///If no data is available
      if (categoryController.featuredCategories.isEmpty) {
        return Center(
          child: Text(
            'No data data found',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: Colors.white),
          ),
        );
      }
      return SizedBox(
        height: 80,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: categoryController.featuredCategories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            final category = categoryController.featuredCategories[index];
            return PVerticalImageText(
              image: category.image,
              title: category.name,
              onTap: () => Get.to(() => const SubCategoriesScreen()),
            );
          },
        ),
      );
    });
  }
}
