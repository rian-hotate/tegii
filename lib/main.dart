import 'package:flutter/material.dart';
import 'package:teg_ii_app/screens/home_screen.dart';

void main() => runApp(TegII());

class TegII extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeScreen.id,
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
      },
      /*TODO pageのルートはここで全部宣言しておいた方が管理が楽です
        routes: <String, WidgetBuilder>{
          '/': (_) => new HomeScreen(),
          '/profile': (_) => ProfileScreen(),
          '/result': (_) => ResultScreen(),
        },
      */
    );
  }
}
