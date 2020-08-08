import 'package:flutter/material.dart';
import 'package:teg_ii_app/screens/home_screen.dart';
import 'package:teg_ii_app/screens/profile_screen.dart';
import 'package:teg_ii_app/screens/result_screen.dart';

void main() => runApp(TegII());

class TegII extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeScreen.id,
      routes: <String, WidgetBuilder>{
        '/': (_) => new HomeScreen(),
        '/profile': (_) => ProfileScreen(),
        '/result': (_) => ResultScreen(),
      },
    );
  }
}
