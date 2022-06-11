import 'package:flutter/material.dart';
import '../screens/category_detail.dart';
import './screens/categories_overview.dart';
import 'package:provider/provider.dart';
import './provider/categories.dart';
import './provider/meals.dart';
import './provider/auth.dart';
import './screens/auth_screen.dart';
import './dummy_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          // ChangeNotifierProvider<Auth>(
          //   create: (ctx) => Auth(),
          // ),
          // ChangeNotifierProvider<Categories>(
          //   create: (ctx) => Categories(),
          // ),
          // ChangeNotifierProvider<Meals>(
          //   create: (ctx) => Meals(),
          // )
        ],
        child: Consumer<Auth>(
            builder: (c, auth, _) => MaterialApp(
                  home: auth.isAuth ? DummyScreen() : AuthScreen(),
                  routes: {
                    '/category_detail': (ctx) => CategoryDetail(),
                  },
                )));
  }
}
