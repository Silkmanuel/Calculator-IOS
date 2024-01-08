import 'package:calculator/controllers/other_functions/cleanspace.dart';
import 'package:calculator/controllers/other_functions/spacesqtd.dart';
import 'package:flutter/material.dart';
import '../other_functions/operation.dart';
import '../other_functions/spacegestor.dart';

class ValueGestor extends ChangeNotifier {
  String operator1 = '';
  String operator2 = '0';
  String result = '';
  String number = '0';
  bool positive = true;
  double size = 95;
  bool clear = false;
  int controller2 = 0;

  List<String> sybombls = ['c', 'AC', '+/-', '%', '/', 'X', '-', '+', '='];
  List<String> signais = ['+/-', '/', 'X', '-', '+'];
  List<String> elements = [
    '7',
    '8',
    '9',
    '4',
    '5',
    '6',
    '1',
    '2',
    '3',
    '0',
    ','
  ];
  int controller = 0;
  bool signal = false;
  String selectedSignal = '';

//-------------------------------
  sizeEvaluate() {
    if (notFeature(number) > 1 && notFeature(number) <= 6) {
      size = size;
    } else if (notFeature(number) > 6 && notFeature(number) <= 7) {
      size = 85;
    } else if (notFeature(number) > 7 && notFeature(number) <= 9) {
      (number.characters.contains(',')) ? size = 70 : size = 64;
    } else if (notFeature(number) > 9 && notFeature(number) <= 12) {
      size = 58;
    }
    notifyListeners();
  }

//-------------------------------
  boot() {
    operator1 = '';
    operator2 = '';
    result = '';
    number = '0';
    size = 95;
  }

//-------------------------------
  reception(String value) {
    if (sybombls.contains(value)) {
      if (value == 'AC') {
        operator1 = '';
        signal = false;
        number = '0';
        size = 95;
      } else if (value == 'c') {
        if (operator1 == '') {
          number = '0';
          size = 95;
          clear = !clear;
          result = '';
          controller2 = 0;
          controller = 0;
        } else {
          clear = !clear;
          number = '0';
          size = 95;
          positive = true;
          selectedSignal = '';
        }
      } else if (value == '+/-') {
        if (positive) {
          number = '-' + number;
          positive = false;
        } else {
          number = cleanFeature(number);
          positive = true;
        }
      } else if (signais.contains(value)) {
        signal = true;

        if (value == '+') {
          selectedSignal = '+';
        } else if (value == '-') {
          selectedSignal = '-';
        } else if (value == 'X') {
          selectedSignal = 'X';
        } else if (value == '/') {
          selectedSignal = '/';
        }
        controller2 = 1;
        if (number.contains(',')) {
          operator1 = vToP(cleanSpace(number));
        } else {
          operator1 = cleanSpace(number);
        }
      } else if (value == '=') {
        operator2 = number;
        if (operator2.contains(',')) {
          operator2 = vToP(cleanSpace(number));
        } else {
          operator2 = cleanSpace(number);
        }
        number = operation(operator1, selectedSignal, operator2);
        number = pToV(number);
        number = spaceResult(number);

        result = number;
        (number.characters.contains('-')) ? positive = false : positive = true;
        controller2 = 3;
        selectedSignal = '';
      } else if (value == '%') {
        if (number.characters.contains(',')) {
          number = vToP(cleanSpace(number));
        } else {
          number = cleanSpace(number);
        }
        number = (double.parse(number) / 100).toString();
        number = pToV(number);
        number = spaceResult(number);
        result = number;
      }
    } else if (elements.contains(value)) {
      if (controller2 == 3) {
        (value == ',') ? number = '0,' : number = value;
        result = '';
        controller2 = 0;
        signal = false;
      } else if (controller2 == 1) {
        (value == ',') ? number = '0,' : number = value;

        controller2 = 0;
        signal = false;
      } else if (number == '0' || number == '-0') {
        if (positive) {
          (value == ',') ? number = '0,' : number = value;
        } else {
          (value == ',') ? number = '-0,' : number = value;
        }

        (value == '0') ? null : clear = true;
      } else {
        //CASO O NUMERO JÁ SE TENHA ADD ALGUM NUMERO
        //CASO HAJA ESPAÇO
        if (number.characters.contains(' ')) {
          if (spacesQtd(number) == 1) {
            if (value == ',') {
              if (number.characters.contains(',')) {
                number = number;
              } else {
                if (notFeature(number) == 11) {
                  number = number;
                } else {
                  number = number + value;
                }
              }
            } else {
              if (notFeature(number) == 11) {
                number = number;
              } else {
                number = number + value;
              }
            }
          } else if (spacesQtd(number) == 2) {
            if (value == ',') {
              if (number.characters.contains(',')) {
                number = number;
              } else {
                if (notFeature(number) == 11) {
                  number = number;
                } else {
                  number = number + value;
                }
              }
            } else {
              if (notFeature(number) == 11) {
                number = number;
              } else {
                number = number + value;
              }
            }
          }
        } else {
          //CASO NÃO TENHA ESPAÇO ,
          if (number.characters.contains(',')) {
            if (value == ',') {
              number = number;
            } else {
              if (notFeature(number) == 10) {
                number = number;
              } else {
                number = number + value;
              }
            }
          } else {
            if (notFeature(number) == 11) {
              number = number;
            } else {
              number = number + value;
            }
          }
        }
      }
    }
    notifyListeners();
  }

//-------------------------------
  spaceEvaluete() {
    if (number.characters.contains(',')) {
    } else {
      if (notFeature(number) == 4) {
        controller = 0;
        // 1234
        // 1 234
        number = spaceFirst(cleanFeature(number));
        (positive) ? number = number : number = '-' + number;
      } else if (notFeature(number) >= 5 && notFeature(number) <= 11) {
        if (notFeature(number) == 6) {
          // 1 2345
          // 12 345
          number = spaceSecound(cleanFeature(number));
          (positive) ? number = number : number = '-' + number;
        } else if (notFeature(number) == 7) {
          // 12 3456
          // 123 456
          number = spaceTrhee(cleanFeature(number));
          (positive) ? number = number : number = '-' + number;
        } else if (notFeature(number) == 8) {
          // 123 4567
          // 1 234 567
          number = space4(cleanFeature(number));
          (positive) ? number = number : number = '-' + number;
        } else if (notFeature(number) == 10) {
          // 1 234 5678
          // 12 345 678
          number = space5(cleanFeature(number));
          (positive) ? number = number : number = '-' + number;
        } else if (notFeature(number) == 11) {
          // 12 345 6789
          // 123 456 789
          if (controller == 0) {
            number = space6(cleanFeature(number));

            (positive) ? number = number : number = '-' + number;
            controller = 1;
          }
        }
      }
    }

    notifyListeners();
  }
}
//-------------------------------

//-------------------------------