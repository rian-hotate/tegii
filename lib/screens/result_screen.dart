import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:teg_ii_app/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:fl_chart/fl_chart.dart';

QuizBrain quizBrain = QuizBrain();

class ResultScreen extends StatefulWidget {
  String name = '', birthday = '', gender = '', age = ''; // 入力値保持用
  ResultScreen(String name, birthday, gender, age) {
    this.name = name;
    this.birthday = birthday;
    this.gender = gender;
    this.age = age;
  }

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  List<Widget> scoreKeeper = [];

  List<Widget> scoreKeeper1 = [];
  List<Widget> scoreKeeper2 = [];
  List<Widget> scoreKeeper3 = [];
  List<Widget> scoreKeeper4 = [];
  List<Widget> scoreKeeper5 = [];
  List<Widget> scoreKeeper6 = [];



  void checkAnswer1(String userPickedAnswer) {
    String correctAnswer = quizBrain.getCorrectAnswer();
    setState(() {
      if (quizBrain.isFinished() == true) {
        Alert(
            context: context,
            title: "お疲れさまでした！",
            content: Column(
              children: <Widget>[
                Text('採点ページへ進んで下さい'),
              ],
            ),
            buttons: [
              DialogButton(
                onPressed: () {
//                  Navigator.pushNamed(context, ResultScreen.id);
                },
                child: Text(
                  "採点ページ",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              )
            ]).show();
        quizBrain.reset();

        scoreKeeper = [];
      } else {
        if (quizBrain.getCorrectAnswer() == 'CP') {
          scoreKeeper1.add(Text(
            '2',
            style: TextStyle(color: Colors.black),
          ));
        } else if (quizBrain.getCorrectAnswer() == 'NP') {
          scoreKeeper2.add(Text(
            '2',
            style: TextStyle(color: Colors.black),
          ));
        } else if (quizBrain.getCorrectAnswer() == 'A') {
          scoreKeeper3.add(Text(
            '2',
            style: TextStyle(color: Colors.black),
          ));
        } else if (quizBrain.getCorrectAnswer() == 'FC') {
          scoreKeeper4.add(Text(
            '2',
            style: TextStyle(color: Colors.black),
          ));
        } else if (quizBrain.getCorrectAnswer() == 'AC') {
          scoreKeeper5.add(Text(
            '2',
            style: TextStyle(color: Colors.black),
          ));
        } else {
          scoreKeeper6.add(Text(
            '2',
            style: TextStyle(color: Colors.black),
          ));
        }
        quizBrain.nextQuestion();
      }
    });
  }

  void checkAnswer2(String userPickedAnswer) {
    String correctAnswer = quizBrain.getCorrectAnswer();
    setState(() {
      if (quizBrain.isFinished() == true) {
        Alert(
            context: context,
            title: "お疲れさまでした！",
            content: Column(
              children: <Widget>[
                Text('採点ページへ進んで下さい'),
              ],
            ),
            buttons: [
              DialogButton(
                onPressed: () {
//                  Navigator.pushNamed(context, ResultScreen.id);
                },
                child: Text(
                  "採点ページ",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              )
            ]).show();
        quizBrain.reset();

        scoreKeeper = [];
      } else {
        if (quizBrain.getCorrectAnswer() == 'CP') {
          scoreKeeper1.add(Text(
            '1',
            style: TextStyle(color: Colors.black),
          ));
        } else if (quizBrain.getCorrectAnswer() == 'NP') {
          scoreKeeper2.add(Text(
            '1',
            style: TextStyle(color: Colors.black),
          ));
        } else if (quizBrain.getCorrectAnswer() == 'A') {
          scoreKeeper3.add(Text(
            '1',
            style: TextStyle(color: Colors.black),
          ));
        } else if (quizBrain.getCorrectAnswer() == 'FC') {
          scoreKeeper4.add(Text(
            '1',
            style: TextStyle(color: Colors.black),
          ));
        } else if (quizBrain.getCorrectAnswer() == 'AC') {
          scoreKeeper5.add(Text(
            '1',
            style: TextStyle(color: Colors.black),
          ));
        } else {
          scoreKeeper6.add(Text(
            '1',
            style: TextStyle(color: Colors.black),
          ));
        }
        quizBrain.nextQuestion();
      }
    });
  }

  void checkAnswer3(String userPickedAnswer) {
    String correctAnswer = quizBrain.getCorrectAnswer();
    setState(() {
      if (quizBrain.isFinished() == true) {
        Alert(
            context: context,
            title: "お疲れさまでした！",
            content: Column(
              children: <Widget>[
                Text('採点ページへ進んで下さい'),
              ],
            ),
            buttons: [
              DialogButton(
                onPressed: () {
//                  Navigator.pushNamed(context, ResultScreen.id);
                },
                child: Text(
                  "採点ページ",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              )
            ]).show();
        quizBrain.reset();

        scoreKeeper = [];
      } else {
        if (quizBrain.getCorrectAnswer() == 'CP') {
          scoreKeeper1.add(Text(
            '0',
            style: TextStyle(color: Colors.black),
          ));
        } else if (quizBrain.getCorrectAnswer() == 'NP') {
          scoreKeeper2.add(Text(
            '0',
            style: TextStyle(color: Colors.black),
          ));
        } else if (quizBrain.getCorrectAnswer() == 'A') {
          scoreKeeper3.add(Text(
            '0',
            style: TextStyle(color: Colors.black),
          ));
        } else if (quizBrain.getCorrectAnswer() == 'FC') {
          scoreKeeper4.add(Text(
            '0',
            style: TextStyle(color: Colors.black),
          ));
        } else if (quizBrain.getCorrectAnswer() == 'AC') {
          scoreKeeper5.add(Text(
            '0',
            style: TextStyle(color: Colors.black),
          ));
        } else {
          scoreKeeper6.add(Text(
            '0',
            style: TextStyle(color: Colors.black),
          ));
        }
        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('アンケート')),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: <Widget>[
            Text('質問', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
            Container(
              height: 300.0,
              color: Color(0xff999999),
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Center(
                        child: Text(
                          quizBrain.getQuestionText(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(15.0),
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            textColor: Colors.black,
                            color: Colors.green,
                            child: Text(
                              'はい',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            onPressed: () {
                              checkAnswer1('はい');
//                              print(scoreKeeper1=[]);
//                              print(scoreKeeper2=[]);
//                              print(scoreKeeper3=[]);
//                              print(scoreKeeper4=[]);
//                              print(scoreKeeper5=[]);
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(15.0),
                          child: FlatButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              textColor: Colors.black,
                              color: Colors.green,
                              child: Text(
                                'どちらでもない',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              onPressed: () {
                                checkAnswer2('どちらでもない');
                              }),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(15.0),
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            textColor: Colors.black,
                            color: Colors.green,
                            child: Text(
                              'いいえ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            onPressed: () {
                              checkAnswer3('いいえ');
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Container(
                  height: 250.0,
                  width: 200.0,
                  child: AspectRatio(
                    aspectRatio: 1.7,
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      color: Colors.white,
                      child: BarChart(
                        BarChartData(
                          alignment: BarChartAlignment.spaceAround,
                          maxY: 20,
                          barTouchData: BarTouchData(
                            enabled: false,
                            touchTooltipData: BarTouchTooltipData(
                              tooltipBgColor: Colors.transparent,
                              tooltipPadding: const EdgeInsets.all(0),
                              tooltipBottomMargin: 3.0,
                              getTooltipItem: (
                                BarChartGroupData group,
                                int groupIndex,
                                BarChartRodData rod,
                                int rodIndex,
                              ) {
                                return BarTooltipItem(
                                  rod.y.round().toString(),
                                  TextStyle(
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              },
                            ),
                          ),
                          titlesData: FlTitlesData(
                            show: true,
                            bottomTitles: SideTitles(
                              showTitles: true,
                              textStyle: TextStyle(
                                  color: const Color(0xff7589a2),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0),
                              margin: 10.0,
                              getTitles: (double value) {
                                switch (value.toInt()) {
                                  case 0:
                                    return 'CP';
                                  case 1:
                                    return 'NP';
                                  case 2:
                                    return 'A';
                                  case 3:
                                    return 'FC';
                                  case 4:
                                    return 'AC';
                                  case 5:
                                    return 'L';
                                  default:
                                    return '';
                                }
                              },
                            ),
                            leftTitles: SideTitles(showTitles: false),
                          ),
                          borderData: FlBorderData(
                            show: false,
                          ),
                          barGroups: [
                            BarChartGroupData(x: 0, barRods: [
                              BarChartRodData(y: 11, color: Colors.lightBlueAccent)
                            ], showingTooltipIndicators: [
                              0
                            ]),
                            BarChartGroupData(x: 1, barRods: [
                              BarChartRodData(y: 9, color: Colors.lightBlueAccent)
                            ], showingTooltipIndicators: [
                              0
                            ]),
                            BarChartGroupData(x: 2, barRods: [
                              BarChartRodData(y: 10, color: Colors.lightBlueAccent)
                            ], showingTooltipIndicators: [
                              0
                            ]),
                            BarChartGroupData(x: 3, barRods: [
                              BarChartRodData(y: 6, color: Colors.lightBlueAccent)
                            ], showingTooltipIndicators: [
                              0
                            ]),
                            BarChartGroupData(x: 4, barRods: [
                              BarChartRodData(y: 17, color: Colors.lightBlueAccent)
                            ], showingTooltipIndicators: [
                              0
                            ]),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  children: <Widget>[
                    Container(
                      height: 105.0,
                      width: 165.0,
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text(
                                  'CP :  ',
                                  style: TextStyle(color: Colors.black),
                                ),
                                Row(
                                  children: scoreKeeper1,
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  'NP :  ',
                                  style: TextStyle(color: Colors.black),
                                ),
                                Row(
                                  children: scoreKeeper2,
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  'A :  ',
                                  style: TextStyle(color: Colors.black),
                                ),
                                Row(
                                  children: scoreKeeper3,
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  'FC :  ',
                                  style: TextStyle(color: Colors.black),
                                ),
                                Row(
                                  children: scoreKeeper4,
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  'AC :  ',
                                  style: TextStyle(color: Colors.black),
                                ),
                                Row(
                                  children: scoreKeeper5,
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  'L :  ',
                                  style: TextStyle(color: Colors.black),
                                ),
                                Row(
                                  children: scoreKeeper6,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Container(
                        height: 105.0,
                        width: 165.0,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: ListView(
                            children: <Widget>[
                              Text('名前 ：  ' + this.widget.name),
                              Text('生年月日 ：  ' + this.widget.birthday),
                              Text('性別 :  ' + this.widget.gender),
                              Text('年齢 :  ' + this.widget.age + ' 歳'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),



          ],
        ),
      ),
    );
  }
}

//import 'package:teg_ii_app/screens/profile_screen.dart';
//
//class ResultScreen extends StatelessWidget {
//  final String text;
////  static const String id = 'result_screen';
//
//  // receive data from the FirstScreen as a parameter
//  ResultScreen({Key key, @required this.text}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(title: Text('Second screen')),
//      body: Column(
//        children: <Widget>[
//          Text(
//            text,
//            style: TextStyle(fontSize: 24),
//          ),
//          Text(
//            text,
//            style: TextStyle(fontSize: 24),
//          ),
//          Text(
//            text,
//            style: TextStyle(fontSize: 24),
//          ),
//          Text(
//            text,
//            style: TextStyle(fontSize: 24),
//          ),
//        ],
//      ),
//    );
//  }
//}
