import 'package:flutter/material.dart';
import 'package:super_base_app/routes/routes_path.dart';
import 'package:super_welcome_app/super_welcome_app.dart';
import 'package:super_home_app/super_home_app.dart';
// import 'package:super_base_app/screens/Home/home.dart';
// import 'package:super_base_app/screens/Welcome/welcome_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    List<String>? queryParameters;
    Uri? uriData;

    if (settings.name != null) {
      uriData = Uri.parse(settings.name!);
      queryParameters = uriData.pathSegments;
    }

    final args = settings.arguments;

    switch (queryParameters!.first){
      // Home
      case RoutesPath.homeScreen:
        return MaterialPageRoute(
          builder: (context) => Container(),
          settings: const RouteSettings(
            name: RoutesPath.homeScreen,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => WelcomeScreen(),
          settings: const RouteSettings(
            name: RoutesPath.welcomeScreen,
          ),
        );
    }
  }
}