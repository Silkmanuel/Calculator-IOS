import 'package:calculator/controllers/other_functions/spacesqtd.dart';
import 'package:flutter/material.dart';

String operation(String number1, String signal, String number2) {
  var n1;
  var n2;
  var result;
  (number1.characters.contains('.'))
      ? n1 = double.parse(number1)
      : n1 = int.parse(number1);
  (number2.characters.contains('.'))
      ? n2 = double.parse(number2)
      : n2 = int.parse(number2);
  if (signal == '/') {
    result = n1 / n2;
  } else if (signal == 'X') {
    result = n1 * n2;
  } else if (signal == '-') {
    result = n1 - n2;
  } else if (signal == '+') {
    result = n1 + n2;
  }
  if (result.toString().characters.contains('.')) {
    if (afterPoint(result.toString()) > 3) {
      result = (double.parse(result.toString())).toStringAsFixed(2);
    }
  } else {
    result = result;
  }
  return result.toString();
}

//--------------------------------
String vToP(String number) {
  String numberAux1 = '';
  for (var e in number.characters) {
    (e == ',') ? numberAux1 = numberAux1 + '.' : numberAux1 = numberAux1 + e;
  }
  return numberAux1;
}

//-----------------------------
String pToV(String number) {
  String numberAux1 = '';
  for (var e in number.characters) {
    (e == '.') ? numberAux1 = numberAux1 + ',' : numberAux1 = numberAux1 + e;
  }
  return numberAux1;
}
//-----------------------------