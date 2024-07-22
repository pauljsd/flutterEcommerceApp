import 'package:ecommerce/bindings/general_bindings.dart';
import 'package:ecommerce/routes/app_routes.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        themeMode: ThemeMode.system,
        theme: PAppTheme.lightTheme,
        darkTheme: PAppTheme.darkTheme,
        initialBinding: GeneralBindings(),
        getPages: AppRoutes.pages,
        //Show loader or Circular Progress Indicator meanwhile Authentication Repository is deciding to show relevant screen.
        home: const Scaffold(
          backgroundColor: PColors.primary,
          body: Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          ),
        ));
  }
}
