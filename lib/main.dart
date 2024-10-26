import 'package:carinfo/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        debugShowCheckedModeBanner: false, routerConfig: _router);
  }

  final _router = GoRouter(routes: [
    GoRoute(path: '/', builder: (context, state) => HomePage()),
    // GoRoute(
    //   path: '/homepage',
    //   builder: (context, state) => HomePage()
    // ),
    // GoRoute(
    //   name: "Login",
    //   path: '/Login',
    //   builder: (context, state) => LoginPage()
    // ),
    // GoRoute(
    //   path: '/addProduct',
    //   builder: (context, state) => AddProduct()
    // )
  ]);
}
