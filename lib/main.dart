import 'package:flutter/material.dart';
import 'package:super_base_app/core/resources/base_app.dart';
import 'package:super_base_app/core/resources/micro_app.dart';
import 'package:super_base_app/core/resources/utils.dart';
import 'package:super_home_app/super_home_app.dart';
import 'package:super_welcome_app/super_welcome_app.dart';
import 'package:super_base_app/routes/routes_path.dart';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget with BaseApp {

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    super.registerRouters();

    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      title: 'The App',
      theme: ThemeData(
        primaryColor: Colors.green[200],
      ),
      onGenerateRoute: super.generateRoute,
      navigatorKey: navigatorKey,
      home: Scaffold(
        appBar: AppBar(
          title: Text('SuperApp Concept'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Click on the buttom below',
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            navigatorKey.currentState!.pushNamed(RoutesPath.welcomeScreen);
          },
          tooltip: 'Increment',
          child: const Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }

  @override
  Map<String, WidgetBuilderArgs> get baseRoutes => {};

  @override
  List<MicroApp> get microApps => [
    SuperHomeAppRelay(),
    SuperWelcomeAppRelay(),
  ];
}