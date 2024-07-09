import 'package:flutter/material.dart';
import 'package:myapp/core/route/route_config.dart';
import 'package:myapp/core/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRoute = AppRoute();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: shadcnLikeTheme(),
      routerConfig: _appRoute.config(),
    );
  }
}
