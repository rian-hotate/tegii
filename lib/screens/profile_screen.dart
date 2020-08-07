import 'package:flutter/material.dart';
import 'package:teg_ii_app/screens/result_screen.dart';


void main() => runApp(ProfileScreen());

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '画面遷移メモ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProfileScreen1(),
      routes: <String, WidgetBuilder> {
        '/my-page-1' : (BuildContext context) => new ProfileScreen1(),
        '/my-page-2' : (BuildContext context) => new ResultScreen('load', 'load', 'load', 'load'),
      },
    );
  }
}

/**
 * ページ1
 */
class ProfileScreen1 extends StatefulWidget  {
  @override
  ProfileScreen1State createState() => ProfileScreen1State();
}

class ProfileScreen1State extends State<ProfileScreen1>  {
  String name = '', birthday = '', gender = '', age ='';// 入力値保持用


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar :  AppBar(title: Text('登録画面')),
        body : Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Center(
                child :ListView(
                    children: [
                      // 入力項目
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          onChanged: (text) {
                            this.name = text;
                          },
                          decoration: InputDecoration(labelText: '名前', border: OutlineInputBorder()),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          onChanged: (text) {
                            this.birthday = text;
                          },
                          decoration: InputDecoration(labelText: '生年月日', border: OutlineInputBorder()),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          onChanged: (text) {
                            this.gender = text;
                          },
                          decoration: InputDecoration(labelText: '性別', border: OutlineInputBorder()),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          onChanged: (text) {
                            this.age = text;
                          },
                          decoration: InputDecoration(labelText: '年齢', border: OutlineInputBorder()),
                        ),
                      ),
                      // ボタン表示
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 100.0),
                        child: MaterialButton(
                            color: Colors.lightBlue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              new MaterialPageRoute<Null>(
                                settings: const RouteSettings(name: "/my-page-2"),
                                builder: (BuildContext context) => ResultScreen(this.name, this.birthday, this.gender, this.age,),
                              ),
                            );
                          },
                          child: Text(
                            'アンケートへ',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 35.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ]
                )
            ),
          ),
        )
    );
  }
}









//class ProfileScreen extends StatefulWidget {
//  static const String id = 'profile_screen';
//  @override
//  _ProfileScreenState createState() => _ProfileScreenState();
//}
//
//class _ProfileScreenState extends State<ProfileScreen> {
//  final _formKey = GlobalKey<FormState>();
//  TextEditingController textFieldController1 = TextEditingController();
//  TextEditingController textFieldController2 = TextEditingController();
//  TextEditingController textFieldController3 = TextEditingController();
//  TextEditingController textFieldController4 = TextEditingController();
//
//  String _text1 = 'Enter something...';
//  String _text2 = 'Enter something...';
//  String _text3 = 'Enter something...';
//  String _text4 = 'Enter something...';
//
//  void _userNameChanged(String value) {
//    setState(() {
//      _text1 = 'Changed1: $value';
//    });
//  }
//
//  void _userNameSubmitted(String value) {
//    setState(() {
//      _text1 = 'Submitted1 $value';
//    });
//  }
//
//  void _birthdayChanged(String value) {
//    setState(() {
//      _text2 = 'Changed2: $value';
//    });
//  }
//
//  void _birthdaySubmitted(String value) {
//    setState(() {
//      _text2 = 'Submitted2 $value';
//    });
//  }
//
//  void _genderChanged(String value) {
//    setState(() {
//      _text3 = 'Changed3: $value';
//    });
//  }
//
//  void _genderSubmitted(String value) {
//    setState(() {
//      _text3 = 'Submitted3 $value';
//    });
//  }
//
//  void _ageChanged(String value) {
//    setState(() {
//      _text4 = 'Changed4: $value';
//    });
//  }
//
//  void _ageSubmitted(String value) {
//    setState(() {
//      _text4 = 'Submitted4 $value';
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('個人情報入力'),
//      ),
//      body: Container(
//        padding: EdgeInsets.all(20),
//        child: Column(
//          children: <Widget>[
//            TextField(
//              decoration: InputDecoration(
//                labelText: '氏名',
//                icon: Icon(Icons.face),
//              ),
//              autocorrect: false,
//              autofocus: true,
//              keyboardType: TextInputType.text,
//              onChanged: _userNameChanged,
//              onSubmitted: _userNameSubmitted,
//              controller: textFieldController1,
//            ),
//            TextField(
//              decoration: InputDecoration(
//                labelText: '生年月日',
//                icon: Icon(Icons.calendar_today),
//              ),
//              autocorrect: false,
//              autofocus: false,
//              keyboardType: TextInputType.text,
//              onChanged: _birthdayChanged,
//              onSubmitted: _birthdaySubmitted,
//              controller: textFieldController2,
//            ),
//            TextField(
//              decoration: InputDecoration(
//                labelText: '男性・女性',
//                icon: Icon(Icons.wc),
//              ),
//              autocorrect: false,
//              autofocus: false,
//              keyboardType: TextInputType.text,
//              onChanged: _genderChanged,
//              onSubmitted: _genderSubmitted,
//              controller: textFieldController3,
//            ),
//            TextField(
//              decoration: InputDecoration(
//                labelText: '年齢',
//                icon: Icon(Icons.account_circle),
//              ),
//              autocorrect: false,
//              autofocus: false,
//              keyboardType: TextInputType.text,
//              onChanged: _ageChanged,
//              onSubmitted: _ageSubmitted,
//              controller: textFieldController4,
//            ),
//            Padding(
//              padding: const EdgeInsets.all(30.0),
//              child: MaterialButton(
//                color: Colors.lightBlue,
//                shape: RoundedRectangleBorder(
//                  borderRadius: BorderRadius.circular(40.0),
//                ),
//                onPressed: () {
//                    _sendDataToResultScreen(context);
//                },
//                child: Text(
//                  'アンケートへ',
//                  style: TextStyle(
//                      color: Colors.white,
//                      fontSize: 35.0,
//                      fontWeight: FontWeight.bold),
//                ),
//              ),
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//
//  void _sendDataToResultScreen(BuildContext context) {
//    String textToSend1 = textFieldController1.text;
//    String textToSend2 = textFieldController2.text;
//    String textToSend3 = textFieldController3.text;
//    String textToSend4 = textFieldController4.text;
//
//    Navigator.push(
//        context,
//        MaterialPageRoute(
//          builder: (context) => ResultScreen(text: textToSend1),
//        ),
//    );
//  }
//}
//
//
