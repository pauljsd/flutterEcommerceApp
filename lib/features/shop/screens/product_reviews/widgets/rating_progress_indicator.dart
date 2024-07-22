import 'package:ecommerce/features/shop/screens/product_reviews/widgets/progress_indicator_and_rating.dart';
import 'package:flutter/material.dart';

class POverallProductRating extends StatelessWidget {
  const POverallProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            '4.8',
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        const Expanded(
            flex: 7,
            child: Column(
              children: [
                PRatingProgressIndicator(
                  text: '5',
                  value: 0.9,
                ),
                PRatingProgressIndicator(
                  text: '4',
                  value: 0.7,
                ),
                PRatingProgressIndicator(
                  text: '3',
                  value: 0.65,
                ),
                PRatingProgressIndicator(
                  text: '2',
                  value: 0.1,
                ),
                PRatingProgressIndicator(
                  text: '1',
                  value: 0.05,
                ),
              ],
            ))
      ],
    );
  }
}
