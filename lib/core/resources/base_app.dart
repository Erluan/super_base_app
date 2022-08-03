import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:super_base_app/routes/routes_path.dart';

import 'micro_app.dart';
import 'utils.dart';

abstract class BaseApp {
  List<MicroApp> get microApps;

  Map<String, WidgetBuilderArgs> get baseRoutes;

  final Map<String, WidgetBuilderArgs> routes = {};

  void registerRouters() {
    if (baseRoutes.isNotEmpty) routes.addAll(baseRoutes);
    if (microApps.isNotEmpty) {
      for (MicroApp microapp in microApps) {
        routes.addAll(microapp.routes);
      }
    }
  }

  Route<dynamic>? generateRoute(RouteSettings settings) {
    var routerName = settings.name;
    var routerArgs = settings.arguments;

    var navigateTo = routes[routerName];
    if (navigateTo == null) return null;

    List<String>? queryParameters;
    Uri? uriData;

    if (settings.name != null) {
      uriData = Uri.parse(settings.name!);
      queryParameters = uriData.pathSegments;
    }

    switch (queryParameters!.first){
    // Home
      case RoutesPath.homeScreen:
        return MaterialPageRoute(
          builder: (context) => navigateTo.call(context, routerArgs),
          settings: const RouteSettings(
            name: RoutesPath.homeScreen,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => navigateTo.call(context, routerArgs),
          settings: const RouteSettings(
            name: RoutesPath.welcomeScreen,
          ),
        );
    }
  }
}