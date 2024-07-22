import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../curved_edges/curved_edges_widget.dart';
import 'circular_container.dart';

class PPrimaryHeaderContainer extends StatelessWidget {
  const PPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return PCurvedEdgeWidget(
      child: Container(
        color: PColors.primary,
        padding: const EdgeInsets.only(bottom: 0),

        ///if [size.isFinite: is not true.inStack error occurred -> Read READ.me file at design errors]
        child: Stack(
          children: [
            ///background Custom shape
            Positioned(
              top: -150,
              right: -250,
              child: PCircularContainer(
                backgroundColor: PColors.textWhite.withOpacity(0.1),
              ),
            ),
            Positioned(
              top: 100,
              right: -300,
              child: PCircularContainer(
                backgroundColor: PColors.textWhite.withOpacity(0.1),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
