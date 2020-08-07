import 'questions.dart';

class QuizBrain {
  int _questionNumber = 0;
  List<Question> _questionBank =[
    Question(q: '他人の言うことに左右されやすい。', a: 'AC'),
    Question(q: '納得のいかないことに抗議する。', a: 'CP'),
    Question(q: 'ユーモアのセンスがある。', a: 'FC'),
    Question(q: '他人の評価が気になる。', a: 'AC'),
    Question(q: '寛大である。', a: 'NP'),
    Question(q: '他人の話を聞くときに根拠を求める。', a: 'A'),
    Question(q: '他人の目を気にして、行動することが多い。', a: 'AC'),
    Question(q: '心が広い。', a: 'NP'),
    Question(q: '一度決めたことがよくぐらつく。', a: 'AC'),
    Question(q: 'いつも楽しめることを探している。', a: 'FC'),
    Question(q: '物事には常に原因があるから結果があると考える。', a: 'A'),
    Question(q: '理屈っぽい。', a: 'A'),
    Question(q: '人の気持ちがよくわかる。', a: 'NP'),
    Question(q: '良いと思うことは貫く。', a: 'CP'),
    Question(q: '議論を好む。', a: 'A'),
    Question(q: 'なにかを始める前には情報を集める。', a: 'A'),
    Question(q: '新しいことをやってみることが多い。', a: 'FC'),
    Question(q: 'のびのびと振る舞うことができる。', a: 'FC'),
    Question(q: '他人に指図されることが多い。', a: 'AC'),
    Question(q: '夜更かしをすることがまったくない。', a: 'FC'),
    Question(q: '何気ない気配りをする。', a: 'NP'),
    Question(q: '人見知りをしない。', a: 'FC'),
    Question(q: '自分に厳しい。', a: 'CP'),
    Question(q: '一度決めたことはやりとおす。', a: 'CP'),
    Question(q: '人の気持ちがなごむように話をする。', a: 'NP'),
    Question(q: '責任感が強い。', a: 'CP'),
    Question(q: '夢を見たことがない。', a: 'L'),
    Question(q: 'しばしば人から言われたとおりに行動してしまう。', a: 'AC'),
    Question(q: '他人に指図されるより指図する方が多い。', a: 'CP'),
    Question(q: '人を笑わせることが得意である。', a: 'FC'),
    Question(q: '人の顔色をうかがってしまう。', a: 'AC'),
    Question(q: '人助けをすることに喜びを感じる。', a: 'NP'),
    Question(q: '物事を言葉できちんと説明できる。', a: 'A'),
    Question(q: '人の言うことが気になる。', a: 'AC'),
    Question(q: '親身になって行動する。', a: 'NP'),
    Question(q: '優柔不断である。', a: 'AC'),
    Question(q: 'つねにその場を楽しむことができる。', a: 'FC'),
    Question(q: '事実の確認を行う。', a: 'A'),
    Question(q: '予測して行動する。', a: 'A'),
    Question(q: '人に優しい言葉をかける。', a: 'NP'),
    Question(q: '良くないことは指摘する。', a: 'CP'),
    Question(q: '理論的である。', a: 'A'),
    Question(q: '筋道立てて考える。', a: 'A'),
    Question(q: 'みんなとにぎやかにさわぐのが好きだ。', a: 'FC'),
    Question(q: '明るい。', a: 'FC'),
    Question(q: '決断することが苦手である。', a: 'AC'),
    Question(q: '風邪をひいたことがまったくない。', a: 'FC'),
    Question(q: '人には温かく接している。', a: 'NP'),
    Question(q: 'よく笑う。', a: 'FC'),
    Question(q: '言うべきことは言う。', a: 'CP'),
    Question(q: 'ついリーダーシップをとってしまう。', a: 'CP'),
    Question(q: '人の役にたつように行動する。', a: 'NP'),
    Question(q: '常に向上心を持つ。', a: 'CP'),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  String getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      print('finished');
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }

}