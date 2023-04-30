import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jumia_clone/core/resources/routes_manager.dart';
import 'package:jumia_clone/core/resources/theme_manager.dart';
import 'package:jumia_clone/core/services/services_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  ServicesLocator().init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp._internal();
  static const MyApp instance = MyApp._internal();
  factory MyApp() => instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: FirebaseAuth.instance.currentUser != null
          ? Routes.homeRoute
          : Routes.loginRoute,
      theme: getAppTheme(),
    );
  }
}
