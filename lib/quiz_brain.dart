enum TYPE {AC, CP, FC, NP, A, L}

class Question {
  String questionText;
  TYPE questionAnswer;

  Question({String q, TYPE a}) {
    questionText = q;
    questionAnswer = a;
  }
}
