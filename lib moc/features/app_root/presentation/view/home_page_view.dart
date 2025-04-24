import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_provider_character_app_new2024/features/app_root/domain/entities/character.dart';
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



class HomePage extends StatefulWidget {
  static const String id = '/';
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RickAndMorty - Provider"),
      ),
      body: Center(
        child: Container(
          color: Colors.white,
          child: _showBody(),
        ),
      ),
    );
  }

  _showBody() {
    final isLoading =
        context.select((HomePageProvider element) => element.isLoading);

    final error = context.select((HomePageProvider element) => element.error);
    final list =
        context.select((HomePageProvider element) => element.charactersList);
    print("data isLoading = $isLoading");

    if (!isLoading && list == null) {
      return _showLoadButton();
    } else if (isLoading) {
      return CircularProgressIndicator();
    } else if (!isLoading && list != null) {
      return _showCharactersList(list);
    } else if (error != null) {
      return Container();
    } else {
      return Container();
    }
  }

  _showLoadButton() {
    return MaterialButton(
      onPressed: () {
        context.read<HomePageProvider>().loadAllCharacters();
      },
      child: Text("Load Data"),
      color: Colors.blue,
    );
  }

  _showCharactersList(List<Character> list) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        final character = list[index];
        return ListTile(
          leading: Image.network(
            character.image,
            errorBuilder: (context, error, stackTrace) {
              return Text("off line");
            },
          ),
          title: Text("${character.name}"),
          subtitle: Text("${character.status}"),
        );
      },
    );
  }
}
