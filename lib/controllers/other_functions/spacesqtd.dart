import 'package:flutter/material.dart';

int spacesQtd(String number) {
  int controllo = 0;
  for (var e in number.characters) {
    (e == ' ') ? controllo++ : controllo = controllo;
  }
  return controllo;
}

//---------------------
int afterPoint(String number) {
  int aux = 0;
  for (int e = 0; e < number.length; e++) {
    if (number[e] == '.') {
      for (var i = e; i < number.length; i++) {
        aux++;
      }
      return aux;
    }
  }
  return aux;
}
