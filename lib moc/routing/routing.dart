import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_provider_character_app_new2024/features/app_root/presentation/view/home_page_view.dart';


class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        {
          return MaterialPageRoute(
              builder: (_) => HomePage());
        }

      default:
        return MaterialPageRoute(builder: (_) => const LoadingPage());
    }
  }
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error Page'),
      ),
      body: const Center(
        child: Text('Error Page '),
      ),
    );
  }
}

class LoadingPage extends StatelessWidget  {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Getting Bots...'),
      ),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}


//////////////////////////////////

class Routes {
  static Route<dynamic> route(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case HomePage.id:
        {
          return materialBuilder(widget: HomePage());
        }

      default:
        return materialBuilder(widget: ErrorPage());
    }
  }
}

MaterialPageRoute materialBuilder({required Widget widget}) {
  return MaterialPageRoute(builder: (_) => widget);
}


