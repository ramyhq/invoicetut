import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_provider_character_app_new2024/features/app_root/domain/entities/character.dart';
import 'package:flutter_clean_architecture_provider_character_app_new2024/features/app_root/presentation/view/home_page_view.dart';
import 'package:flutter_clean_architecture_provider_character_app_new2024/features/app_root/presentation/model_view/home_page_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_clean_architecture_provider_character_app_new2024/di/injection_container.dart' as di;

class AppRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomePageProvider>(
          create: (context) {
            return di.sl<HomePageProvider>();
          },
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage(),
      ),
    );
  }
}