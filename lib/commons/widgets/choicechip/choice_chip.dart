import 'package:ecommerce/commons/widgets/custom_shapes/containers/circular_container.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class PChoiceChip extends StatelessWidget {
  const PChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = PHelperFunctions.getColor(text) != null;

    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: isColor ? const SizedBox() : Text(text),
        selected: selected,
        onSelected: (value) {},
        labelStyle: TextStyle(color: selected ? PColors.white : null),
        avatar: isColor
            ? PCircularContainer(
                width: 50,
                height: 50,
                backgroundColor: PHelperFunctions.getColor(text)!,
              )
            : null,
        shape: isColor ? const CircleBorder() : null,
        labelPadding: isColor ? const EdgeInsets.all(0) : null,
        padding: isColor ? const EdgeInsets.all(0) : null,
        backgroundColor: isColor
            ? PHelperFunctions.getColor(text)!
            : Colors.grey.withOpacity(0.2),
      ),
    );
  }
}
