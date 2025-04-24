import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clean_architecture_provider_character_app_new2024/const/app_colors.dart';
import 'package:flutter_clean_architecture_provider_character_app_new2024/const/app_text_style.dart';
import 'package:flutter_clean_architecture_provider_character_app_new2024/widgets/app_widgets/app_toast.dart';


class CommonAppBar {
  static Widget getPrimaryAppbar(BuildContext context, String title){
    return AppBar(
        backgroundColor: AppColors.darkPrimary, systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark
    ),
        titleSpacing: 0,
        title: Text(title,),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {Navigator.pop(context);},
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showToastClicked(context, "Search");
            },
          ),
        ]
    );
  }

  static Widget getPrimaryAppbarLight(BuildContext context, String title){
    return AppBar(
        backgroundColor: Colors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark
        ),
        iconTheme: const IconThemeData(color: AppColors.grey_60),
        titleSpacing: 0,
        title: Text(title, style: MyText.title(context)!.copyWith(
            color: AppColors.grey_60
        )),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {Navigator.pop(context);},
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showToastClicked(context, "Search");
            },
          ),
        ]
    );
  }

  static Widget getPrimarySettingAppbar(BuildContext context, String title, { bool light = false }){
    return AppBar(
        backgroundColor: light ? Colors.white : AppColors.primary,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark
        ), titleSpacing: 0,
        iconTheme: IconThemeData(color: light ? AppColors.grey_60 : Colors.white),
        title: Text(title, style: AppTextStyle.titleMedium(context)!.copyWith(
            color: light ? AppColors.grey_60 : Colors.white
        )),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showToastClicked(context, "Search");
            },
          ),
          PopupMenuButton<String>(
            onSelected: (String value){
              showToastClicked(context, value);
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: "Settings", child: Text("Settings"),
              ),
            ],
          )
        ]
    );
  }

  static Widget getPrimaryBackAppbar(BuildContext context, String title){
    return AppBar(
        backgroundColor: AppColors.primary, systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark
    ),
        title: Text(title,),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showToastClicked(context, "Search");
            },
          ),
        ]
    );
  }


  static void showToastClicked(BuildContext context, String action){
    print(action);
    AppToast.show(action+" clicked", context);
  }
}
