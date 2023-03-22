import 'package:flutter/material.dart';

import 'routing/delegate.dart';
import 'routing/parser.dart';

class AgroNpApp extends StatefulWidget {
  const AgroNpApp({super.key});

  @override
  State<StatefulWidget> createState() => _AgroNpAppState();
}

class _AgroNpAppState extends State<AgroNpApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  late final AppRouterDelegate _routerDelegate;

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
