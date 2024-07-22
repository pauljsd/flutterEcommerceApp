import 'package:ecommerce/commons/widgets/layouts/grid_layout.dart';
import 'package:ecommerce/commons/widgets/shimmers/shimmer.dart';
import 'package:flutter/material.dart';

class PBrandsShimmer extends StatelessWidget {
  const PBrandsShimmer({super.key, this.itemCount = 4});

  final itemCount;

  @override
  Widget build(BuildContext context) {
    return PGridLayout(
        mainAxisExtent: 80,
        itemCount: itemCount,
        itemBuilder: (_, __) => const PShimmerEffect(width: 300, height: 80));
  }
}
