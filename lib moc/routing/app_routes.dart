import 'package:flutter/material.dart';

class AppRoutes {
  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {

        initialRoute: TellUsAboutYourselfScreen.builder
      };
}


///////////////////// View ////////////////////////


i
class TellUsAboutYourselfScreen extends StatelessWidget {
  const TellUsAboutYourselfScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<TellUsAboutYourselfBloc>(
        create: (context) => TellUsAboutYourselfBloc(TellUsAboutYourselfState(
            tellUsAboutYourselfModelObj: TellUsAboutYourselfModel()))
          ..add(TellUsAboutYourselfInitialEvent()),
        child: TellUsAboutYourselfScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TellUsAboutYourselfBloc, TellUsAboutYourselfState>(
        builder: (context, state) {
          return SafeArea(
              child: Scaffold(
                  body: Container(
                      child:Text("msg_choose_your_identity",))));
        });
  }



}

