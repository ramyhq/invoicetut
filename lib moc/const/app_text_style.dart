import 'package:flutter/material.dart';

//*
// This file will contain Text Styles of app
//*

// This is Custom TextStyles
// Splash TextStyles

//This is Class for Default Theme Styles
class AppTextStyle{
  //display
  static TextStyle? displayLarge(BuildContext context){
    return Theme.of(context).textTheme.displayLarge;
  }
  static TextStyle? displayMedium(BuildContext context){
    return Theme.of(context).textTheme.displayMedium;
  }
  static TextStyle? displaySmall(BuildContext context){
    return Theme.of(context).textTheme.displaySmall;
  }

  //headline
  static TextStyle? headlineLarge(BuildContext context){
    return Theme.of(context).textTheme.headlineLarge;
  }
  static TextStyle? headlineMedium(BuildContext context){
    return Theme.of(context).textTheme.headlineMedium;
  }
  static TextStyle? headlineSmall(BuildContext context){
    return Theme.of(context).textTheme.headlineSmall;
  }

  //title
  static TextStyle? titleLarge(BuildContext context){
    return Theme.of(context).textTheme.titleLarge;
  }
  static TextStyle? titleMedium(BuildContext context){
    return Theme.of(context).textTheme.titleMedium;
  }
  static TextStyle? titleSmall(BuildContext context){
    return Theme.of(context).textTheme.titleSmall;
  }

  //body
  static TextStyle? bodyLarge(BuildContext context){
    return Theme.of(context).textTheme.bodyLarge;
  }
  static TextStyle? bodyMedium(BuildContext context){
    return Theme.of(context).textTheme.bodyMedium;
  }
  static TextStyle? bodySmall(BuildContext context){
    return Theme.of(context).textTheme.bodySmall;
  }

  //label
  static TextStyle? labelLarge(BuildContext context){
    return Theme.of(context).textTheme.labelLarge;
  }
  static TextStyle? labelMedium(BuildContext context){
    return Theme.of(context).textTheme.labelMedium;
  }
  static TextStyle? labelSmall(BuildContext context){
    return Theme.of(context).textTheme.labelSmall;
  }



  // CopyWith
  static TextStyle titleMediumCopyWithFont18(BuildContext context){
    return Theme.of(context).textTheme.titleMedium!.copyWith(
      fontSize: 18,
    );
  }
  static TextStyle? labelLargeCopyWithLetterSpacing(BuildContext context){
    return Theme.of(context).textTheme.labelLarge!.copyWith(
        letterSpacing: 1
    );
  }

}