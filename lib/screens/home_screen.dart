import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teg_ii_app/screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(child: Text('Tokyo University Egogram Ver.II')),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: Column(
            children: <Widget>[
              Text(
                'TEG II',
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold,
                  fontSize: 100.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  '監修',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              ),
              Text(
                '東京大学医学部',
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              Text(
                '心療内科TEG研究会',
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              Container(
                height: 200.0,
                width: double.infinity,
                child: SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: Image.asset('images/image.png'),
                ),
              ),
              MaterialButton(
                color: Colors.lightBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
                onPressed: () {
                  // TODO
                  // Navigator.pushNamed(context, "/profile");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfileScreen()));
//                  Navigator.pushNamed(context, ProfileScreen.id);
                },
                child: Text(
                  '入力画面へ',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
