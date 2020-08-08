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
      routes: <String, WidgetBuilder>{
        '/my-page-1': (BuildContext context) => new ProfileScreen1(),
        '/my-page-2': (BuildContext context) =>
            new ResultScreen('load', 'load', 'load', 'load'),
      },
    );
  }
}

class ProfileScreen1 extends StatefulWidget {
  @override
  ProfileScreen1State createState() => ProfileScreen1State();
}

class ProfileScreen1State extends State<ProfileScreen1> {

  String name = '', birthday = '', gender = '', age = ''; // 入力値保持用
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('登録画面')),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Center(
                child: ListView(children: [
              // 入力項目
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (text) {
                    this.name = text;
                  },
                  decoration: InputDecoration(
                      labelText: '名前', border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                // TODO 生年月日はshowDatePickerとか使った方が良い
                // https://api.flutter.dev/flutter/material/showDatePicker.html
                child: TextField(
                  onChanged: (text) {
                    this.birthday = text;
                  },
                  decoration: InputDecoration(
                      labelText: '生年月日', border: OutlineInputBorder()),
                ),
              ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      onChanged: (text) {
                        this.gender = text;
                      },
                      decoration: InputDecoration(
                          labelText: '性別', border: OutlineInputBorder()),
                    ),
                  ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (text) {
                    this.age = text;
                  },
                  decoration: InputDecoration(
                      labelText: '年齢', border: OutlineInputBorder()),
                ),
              ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
                child: Container(
                    child: Text(
                  'アンケートは、あなたの行動パターンについてお聞きするもので、読んで感じた通りに答えて下さい。',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                )),
              ),
              // ボタン表示
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 30.0, vertical: 30.0),
                child: MaterialButton(
                  color: Colors.lightBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  onPressed: () {
                    // TODO ここは入力フォームに値が入っているかの確認をした方が良い
                    if (name.isNotEmpty &&
                        birthday.isNotEmpty &&
                        gender.isNotEmpty &&
                        age.isNotEmpty)
                      Navigator.push(
                        context,
                        new MaterialPageRoute<Null>(
                          settings: const RouteSettings(name: "/my-page-2"),
                          builder: (BuildContext context) => ResultScreen(
                            this.name,
                            this.birthday,
                            this.gender,
                            this.age,
                          ),
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
            ])),
          ),
        ));
  }
}
