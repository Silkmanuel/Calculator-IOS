//-------------------------------
import 'package:flutter/material.dart';

import 'cleanspace.dart';

spaceFirst(String number) {
  String numberAux1 = '';
  if (number.length == 4) {
    for (var i = 0; i < number.length; i++) {
      (i == 0)
          ? numberAux1 = number[0] + ' '
          : numberAux1 = numberAux1 = numberAux1 + number[i];
    }
    return numberAux1;
  }
}

//-------------------------------
spaceSecound(String number) {
  String numberAux1 = '';
  //1 2345
  //12 345
  for (var i = 0; i < number.length; i++) {
    if (i == 1) {
      continue;
    } else if (i == 2) {
      numberAux1 = numberAux1 + number[i] + ' ';
    } else {
      numberAux1 = numberAux1 + number[i];
    }
  }
  return numberAux1;
}

//-------------------------------
spaceTrhee(String number) {
  String numberAux2 = '';
  // 12 3456
  // 123 456
  for (var i = 0; i < number.length; i++) {
    if (i == 2) {
      continue;
    } else if (i == 3) {
      numberAux2 = numberAux2 + number[i] + ' ';
    } else {
      numberAux2 = numberAux2 + number[i];
    }
  }
  return numberAux2;
}

//-------------------------------
space4(String number) {
  String numberAux2 = '';
  // 123 4567
  // 1 234 567
  for (var i = 0; i < number.length; i++) {
    if (i == 3) {
      continue;
    } else if (i == 0 || i == 4) {
      numberAux2 = numberAux2 + number[i] + ' ';
    } else {
      numberAux2 = numberAux2 + number[i];
    }
  }
  return numberAux2;
}

//-------------------------------
space5(String number) {
  String numberAux2 = '';
  // 1 234 5678
  // 1.2-34.5-678
  // 12 345 678
  for (var i = 0; i < number.length; i++) {
    if (i == 1 || i == 5) {
      continue;
    } else if (i == 2 || i == 6) {
      numberAux2 = numberAux2 + number[i] + ' ';
    } else {
      numberAux2 = numberAux2 + number[i];
    }
  }
  return numberAux2;
}

//-------------------------------
space6(String number) {
  String numberAux2 = '';
  // 12 345 6789
  // 12.3-45.6-789
  // 123 456 789
  for (var i = 0; i < number.length; i++) {
    if (i == 2 || i == 6) {
      continue;
    } else if (i == 3 || i == 7) {
      numberAux2 = numberAux2 + number[i] + ' ';
    } else {
      numberAux2 = numberAux2 + number[i];
    }
  }
  return numberAux2;
}

//-------------------------------
String spaceResult(String number) {
  String numberAux2 = '';
  for (var e in number.characters) {
    numberAux2 = numberAux2 + e;
    if (numberAux2.characters.contains(',')) {
    } else if (notFeature(numberAux2) == 4) {
      numberAux2 = spaceFirst(cleanFeature(numberAux2));
    } else if (notFeature(numberAux2) >= 5 && notFeature(numberAux2) <= 11) {
      if (notFeature(numberAux2) == 6) {
        numberAux2 = spaceSecound(cleanFeature(numberAux2));
      } else if (notFeature(numberAux2) == 7) {
        numberAux2 = spaceTrhee(cleanFeature(numberAux2));
      } else if (notFeature(numberAux2) == 8) {
        numberAux2 = space4(cleanFeature(numberAux2));
      } else if (notFeature(numberAux2) == 10) {
        numberAux2 = space5(cleanFeature(numberAux2));
      } else if (notFeature(numberAux2) == 11) {
        numberAux2 = space6(cleanFeature(numberAux2));
      }
    }
  }
  return numberAux2;
}
