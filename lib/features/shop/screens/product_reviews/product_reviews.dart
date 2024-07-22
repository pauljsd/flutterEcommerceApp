import 'package:ecommerce/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:ecommerce/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:flutter/material.dart';

import '../../../../commons/widgets/appbar/appbar.dart';
import '../../../../commons/widgets/products/rating/rating_indicator.dart';
import '../../../../utils/constants/sizes.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///appBar
      appBar: const PAppBar(title: Text('Reviews & Ratings')),

      ///body
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(PSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
                'This is the Rating and Review You need to go with cos they are from customers like you'),
            const SizedBox(
              height: PSizes.spaceBtwItems,
            ),

            ///Overall Product Rating
            const POverallProductRating(),
            const PRatingBarIndicator(
              rating: 4.5,
            ),
            Text(
              '1212',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(
              height: PSizes.spaceBtwSections,
            ),

            ///User Review List
            const UserReviewCard(),
          ],
        ),
      ),
    );
  }
}
