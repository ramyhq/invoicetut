import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradingapp_api_test/feature1/presentation/cubit/bot/bot_cubit.dart';
import 'package:tradingapp_api_test/feature1/presentation/widgets/list_tile.dart';
import 'package:tradingapp_api_test/feature1/presentation/widgets/textfield_container_widget.dart';
import 'package:tradingapp_api_test/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _inputController = TextEditingController();

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {

    return BlocBuilder<BotCubit, BotState>(
      builder: (context, botState) {
        if (botState is BotsLoaded || botState is BotsInitial) {
          return Scaffold(
            floatingActionButton: FloatingActionButton.extended(
               backgroundColor: Colors.black,
              label: const Text('Add Bot',style: TextStyle(color: Colors.white),),
              icon: const Icon(Icons.add,color: Colors.white,),
              onPressed: () {
                Navigator.pushNamed(context, 'add_bots_page');
              },

            ),
            appBar: AppBar(
              title: const Text("Home Bots"),
              actions: [
                InkWell(
                  onTap: () {
                    BlocProvider.of<BotCubit>(context).getBots();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: const [
                        Icon(Icons.get_app),
                        Text(' Get Bots'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            body: (botState is BotsLoaded)
                ? ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 50),
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
                    itemCount: botState.bots.length,
                    itemBuilder: (context, index) {
                      return BotListTile(botModel:botState.bots[index]);
                    })
                : Container(),
          );
        } else if (botState is BotsLoading) {
          return const LoadingPage();
        }
        else {
          return const ErrorPage();
        }
      },
    );
  }
}
