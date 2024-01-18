// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:practice/routing/router_config.dart';
import 'package:practice/routing/routers.dart';
import 'package:practice/secure_Store/secureStorage.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  final SecureStorage _secureStorage = SecureStorage();
  
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.paused) {
      if (await _secureStorage.hasToken()) {
        print('Calling user API when app is closed');
      }
    } else if (state == AppLifecycleState.resumed) {
      if (await _secureStorage.hasToken()) {
        print('Updating user details and navigating to the dashboard');
        _redirectToDashboard();
      }
    }
  }

  Future<void> _redirectToDashboard() async {
    final bool login = await _secureStorage.hasToken();
    if (login) {
      GoRouter.of(context).go(MyAppRouteConstants.dashboard);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: MyAppRoute.configureRoutes(),
        title: "Go router");
  }
}
