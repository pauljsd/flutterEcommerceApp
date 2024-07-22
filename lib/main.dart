///I added this next line oo
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app.dart';
import 'data/repositories/authentication/authentication_repository.dart';
import 'firebase_options.dart';

///Entry Point of Flutter App
Future<void> main() async {
  //Todo: Add Widgets Binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  //Todo: GetX Local Storage
  await GetStorage.init();

  //Todo: Init Payment Method

  //Todo: Await Native Splash until other item load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  //Todo: Initialise Firebase and Authentication Repository
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then(
    (FirebaseApp value) => Get.put(AuthenticationRepository()),
  );

  ///I added this too ooo
  // // Initialize App Check
  // await FirebaseAppCheck.instance.activate(
  //   // webProvider: ReCaptchaV3Provider('recaptcha-v3-site-key'),
  //   androidProvider: AndroidProvider.playIntegrity,
  //   // appleProvider: AppleProvider.appAttest,
  // );

  //Load all the Material Design / Theme / Localizations / Binding
  runApp(const App());
}
