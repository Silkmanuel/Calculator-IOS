import 'package:flutter/material.dart';

String cleanSpace(String number) {
  String numberAux1 = '';
  for (var i = 0; i < number.length; i++) {
    if (number[i] == ' ') {
      continue;
    }
    numberAux1 = numberAux1 + number[i];
  }
  return numberAux1;
}

//-----
String cleanFeature(String number) {
  String numberAux1 = '';
  for (var e in number.characters) {
    (e == '-') ? numberAux1 = numberAux1 : numberAux1 = numberAux1 + e;
  }
  return numberAux1;
}

int notFeature(String number) {
  int quantity = 0;
  for (var e in number.characters) {
    (e == '-') ? quantity = quantity : quantity = quantity + 1;
  }
  return quantity;
}
