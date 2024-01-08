import 'package:calculator/controllers/provider/value_gestor.dart';
import 'package:calculator/pages/myapp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ValueGestor(),
    child: const MyApp(),
  ));
}
