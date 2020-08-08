enum ANSWER_TYPE {Y, N, O}

class AnswerData {
  final int qIndex;
  final ANSWER_TYPE answerType;

  AnswerData({
    this.qIndex,
    this.answerType,
  });
}
