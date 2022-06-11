import 'package:flutter/material.dart';
import '../screens/category_detail.dart';
import 'package:provider/provider.dart';
import './provider/auth.dart';
import './screens/auth_screen.dart';
import './screens/domain.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Consumer<Auth>(
          builder: (c, auth, _) => MaterialApp(
            home: auth.isAuth
                ? MyHomePage(
                    title: "DOMAIN SELECTION",
                  )
                : AuthScreen(),
            routes: {
              '/category_detail': (ctx) => CategoryDetail(),
            },
          ),
        ),
        //body: Text("Hello"),
      ),
    );
  }
}
