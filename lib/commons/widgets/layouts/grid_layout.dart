import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';

class PGridLayout extends StatelessWidget {
  const PGridLayout(
      {super.key,
      required this.itemCount,
      required this.itemBuilder,
      this.mainAxisExtent = 288});

  final int itemCount;
  final double? mainAxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: itemCount,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: PSizes.gridViewSpacing,
          crossAxisSpacing: PSizes.gridViewSpacing,
          mainAxisExtent: mainAxisExtent,
        ),
        itemBuilder: itemBuilder);
  }
}
