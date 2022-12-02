import 'package:flutter/cupertino.dart';

class ResultProvider extends ChangeNotifier {

  bool isMail = true;
  double result = 20.5;
  int age = 18;

  String get resultPhrase {
    String resultText = "";
    if (result >= 30) {
      resultText = "Obese";
    } else if (result > 25 && result < 30) {
      resultText = "Overweight";
    } else if (result >= 18.5 && result <= 24.9) {
      resultText = "Normal";
    } else {
      resultText = "Thin";
    }
    return resultText;
  }
}
