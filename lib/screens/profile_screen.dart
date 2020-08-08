import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:teg_ii_app/model/user_data.dart';
import "package:intl/intl.dart";
import 'package:intl/date_symbol_data_local.dart';

class ProfileScreen extends StatefulWidget {
  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  String name = '';
  DateTime birthday;
  GENDER gender;
  int age;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting("ja_JP");
  }

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
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: FlatButton(
                    onPressed: () async {
                      final selectedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime(DateTime.now().year - 30),
                        firstDate: DateTime(DateTime.now().year - 120),
                        lastDate: DateTime(DateTime.now().year + 1),
                      );
                      if (selectedDate != null) setState(() {
                        birthday = selectedDate;
                      });
                    },
                    child: Text(
                      birthday != null
                          ? DateFormat("yyyy/MM/dd", "ja_JP").format(birthday)
                          : "選択してください",
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: RadioListTile(
                          value: GENDER.man,
                          groupValue: gender,
                          onChanged: (GENDER value) => setState(() {
                            gender = value;
                          }),
                          title: Text(EnumToString.parse(GENDER.man)),
                        ),
                      ),
                      Expanded(
                        child: RadioListTile(
                          value: GENDER.woman,
                          groupValue: gender,
                          onChanged: (GENDER value) => setState(() {
                            gender = value;
                          }),
                          title: Text(EnumToString.parse(GENDER.woman)),
                        ),
                      ),
                      Expanded(
                        child: RadioListTile(
                          value: GENDER.other,
                          groupValue: gender,
                          onChanged: (GENDER value) => setState(() {
                            gender = value;
                          }),
                          title: Text(EnumToString.parse(GENDER.other)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: FlatButton(
                    onPressed: () {
                      Picker(
                          adapter: NumberPickerAdapter(data: [
                            NumberPickerColumn(
                                begin: 0, end: 130, initValue: 20),
                          ]),
                          hideHeader: true,
                          title: new Text("年齢を選択してください"),
                          onConfirm: (Picker picker, List value) {
                            setState(() {
                              age = picker.getSelectedValues().first;
                            });
                          }).showDialog(context);
                    },
                    child: Text(age != null ? age.toString() : "選択してください"),
                  ),
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
                    if (name.isNotEmpty &&
                        birthday != null &&
                        gender != null &&
                        age != null)
                      Navigator.of(context).popAndPushNamed("/result",
                          arguments: UserData(
                              name: name,
                              birthday: birthday,
                              gender: gender,
                              age: age));
                    else showDialog(
                      context: context,
                      builder: (context) {
                        return SimpleDialog(
                          title: Text("入力されていない項目があります"),
                          children: <Widget>[
                            // コンテンツ領域
                            SimpleDialogOption(
                              onPressed: () => Navigator.of(context).pop(),
                              child: Text(
                                "OK",
                                style:
                                TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        );
                      },
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
