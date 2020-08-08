import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:teg_ii_app/model/answer_data.dart';
import 'package:teg_ii_app/model/user_data.dart';
import 'package:teg_ii_app/quiz_brain.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:teg_ii_app/util/util.dart';
import 'package:intl/date_symbol_data_local.dart';
import "package:intl/intl.dart";

class ResultScreen extends StatefulWidget {
  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  int answerCnt = 0;
  List<AnswerData> answerList = [];

  @override
  void initState() {
    super.initState();
    initializeDateFormatting("ja_JP");
  }

  double getValue(TYPE type, int threshold) {
    return (threshold *
                answerList
                    .where((element) =>
                        element.answerType == ANSWER_TYPE.Y &&
                        questionBank.elementAt(element.qIndex).questionAnswer ==
                            type)
                    .length +
            answerList
                .where((element) =>
                    element.answerType == ANSWER_TYPE.O &&
                    questionBank.elementAt(element.qIndex).questionAnswer ==
                        type)
                .length)
        .toDouble();
  }

  List<Widget> getAnswerTypeWidget(TYPE type) {
    List<Widget> list = [];

    answerList.forEach((element) {
      if (questionBank.elementAt(element.qIndex).questionAnswer == type) {
        list.add(Text("${EnumToString.parse(element.answerType)}"));
      }
    });
    return list;
  }

  int getOtherAnswer() {
    return answerList
        .where((element) => element.answerType == ANSWER_TYPE.O)
        .length;
  }

  List<Widget> getUserDataWidget() {
    final UserData args = ModalRoute.of(context).settings.arguments;
    return [
      Text('名前 ：  ' + args.name),
      Text(
          '生年月日 ：  ' + DateFormat("yyyy/MM/dd", "ja_JP").format(args.birthday)),
      Text('性別 :  ' + EnumToString.parse(args.gender)),
      Text('年齢 :  ' + args.age.toString() + ' 歳'),
    ];
  }

  bool checkFinish() {
    return questionBank.length <= answerCnt;
  }

  void showFinishAlert() {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text("お疲れさまでした！"),
          children: <Widget>[
            // コンテンツ領域
            SimpleDialogOption(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                "あなたのTEGエゴグラムを確認して下さい",
                style:
                TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      },
    );
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
            checkFinish()
                ? Container(
              height: 300.0,
              color: Color(0xff999999),
              child: Center(
                child: Text(
                  "質問は全て終了しました",
                  style: TextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
            ) : Expanded(
              flex: 4,
              child: Column(
                children: <Widget>[
                  Text(
                    "質問 ${answerCnt + 1}/${questionBank.length}",
                    style: TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
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
                                questionBank
                                    .elementAt(answerCnt)
                                    .questionText,
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
                                    borderRadius:
                                    BorderRadius.circular(10.0),
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
                                    answerList.add(AnswerData(
                                        qIndex: answerCnt,
                                        answerType: ANSWER_TYPE.Y));
                                    setState(() {
                                      answerCnt++;
                                    });
                                    if (checkFinish()) showFinishAlert();
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(15.0),
                                child: FlatButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(10.0),
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
                                      answerList.add(AnswerData(
                                          qIndex: answerCnt,
                                          answerType: ANSWER_TYPE.O));
                                      setState(() {
                                        answerCnt++;
                                      });
                                      if (checkFinish()) showFinishAlert();
                                    }),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(15.0),
                                child: FlatButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(10.0),
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
                                    answerList.add(AnswerData(
                                        qIndex: answerCnt,
                                        answerType: ANSWER_TYPE.N));
                                    setState(() {
                                      answerCnt++;
                                    });
                                    if (checkFinish()) showFinishAlert();
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: BarChart(
                      BarChartData(
                        alignment: BarChartAlignment.spaceAround,
                        maxY: 30,
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
                            BarChartRodData(
                                y: getValue(TYPE.CP, 2),
                                color: Colors.lightBlueAccent)
                          ], showingTooltipIndicators: [
                            0
                          ]),
                          BarChartGroupData(x: 1, barRods: [
                            BarChartRodData(
                                y: getValue(TYPE.NP, 2),
                                color: Colors.lightBlueAccent)
                          ], showingTooltipIndicators: [
                            0
                          ]),
                          BarChartGroupData(x: 2, barRods: [
                            BarChartRodData(
                                y: getValue(TYPE.A, 2),
                                color: Colors.lightBlueAccent)
                          ], showingTooltipIndicators: [
                            0
                          ]),
                          BarChartGroupData(x: 3, barRods: [
                            BarChartRodData(
                                y: getValue(TYPE.FC, 2),
                                color: Colors.lightBlueAccent)
                          ], showingTooltipIndicators: [
                            0
                          ]),
                          BarChartGroupData(x: 4, barRods: [
                            BarChartRodData(
                                y: getValue(TYPE.AC, 2),
                                color: Colors.lightBlueAccent)
                          ], showingTooltipIndicators: [
                            0
                          ]),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          color: Colors.grey,
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text(
                                      '${EnumToString.parse(TYPE.CP)} :  ',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    Row(
                                      children: getAnswerTypeWidget(TYPE.CP),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      '${EnumToString.parse(TYPE.NP)} :  ',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    Row(
                                      children: getAnswerTypeWidget(TYPE.NP),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      '${EnumToString.parse(TYPE.A)} :  ',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    Row(
                                      children: getAnswerTypeWidget(TYPE.A),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      '${EnumToString.parse(TYPE.FC)} :  ',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    Row(
                                      children: getAnswerTypeWidget(TYPE.FC),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      '${EnumToString.parse(TYPE.AC)} :  ',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    Row(
                                      children: getAnswerTypeWidget(TYPE.AC),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      '${EnumToString.parse(TYPE.L)} :  ',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    Row(
                                      children: getAnswerTypeWidget(TYPE.L),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: Text(
                                          'Q \(どちらでもない回数\）= ${getOtherAnswer()}'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 0.0),
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: getUserDataWidget(),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ),
          ],
        ),
      ),
    );
  }
}
