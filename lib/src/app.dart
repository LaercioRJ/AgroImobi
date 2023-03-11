import 'package:flutter/material.dart';

import 'routing/delegate.dart';
import 'routing/parser.dart';

class AgroNpApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AgroNpAppState();
}

class _AgroNpAppState extends State<AgroNpApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  late final _routerDelegate;

  final AgroNpInformationParser _routeInformationParser =
      AgroNpInformationParser();

  @override
  void initState() {
    _routerDelegate = AppRouterDelegate(navigatorKey: _navigatorKey);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Books App',
      routerDelegate: _routerDelegate,
      routeInformationParser: _routeInformationParser,
    );
  }
}

/*class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // Application name
        title: 'Flutter Hello World',
        // Application theme data, you can set the colors for the application as
        // you want
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Meu Aplicativo'),
          ),
          body: const Text('O corpo do meu app'),
          drawer: const DrawerMenu(),
        ));
  }
}*/
