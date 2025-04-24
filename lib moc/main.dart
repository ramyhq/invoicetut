import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clean_architecture_provider_character_app_new2024/commons/caching/app_settings_cache.dart';
import 'package:flutter_clean_architecture_provider_character_app_new2024/features/app_root/presentation/view/home_page_view.dart';
import 'package:flutter_clean_architecture_provider_character_app_new2024/features/app_root/presentation/model_view/home_page_provider.dart';
// import 'package:flutter_stetho/flutter_stetho.dart';
import 'package:flutter_clean_architecture_provider_character_app_new2024/di/injection_container.dart' as di;
import 'package:provider/provider.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();



void main() async {
//  if (kDebugMode) Stetho.initialize();

  await di.init();

  runApp(AppRoot());
}



void main2() async{
  WidgetsFlutterBinding.ensureInitialized();
  Future.wait([
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]),
    AppSettingsCache().init(),
    Firebase.initializeApp(),
    di.init(),

  ]).then((value) {
    runApp(AppRoot());
  });

}