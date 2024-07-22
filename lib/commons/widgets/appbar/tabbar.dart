import 'package:ecommerce/utils/device/device_utility.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class PTabBar extends StatelessWidget implements PreferredSizeWidget {
  const PTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = PHelperFunctions.isDarkMode(context);
    return Material(
      color: dark ? PColors.black : PColors.white,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: PColors.grey,
        labelColor: dark ? PColors.white : PColors.primary,
        unselectedLabelColor: PColors.darkGrey,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(PDeviceUtils.getAppBarHeight());
}
