import 'package:calculator/controllers/provider/value_gestor.dart';
import 'package:calculator/pages/components/buttom.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var valueGestor = Provider.of<ValueGestor>(context);
    double tamanho = 35;
    Color backgroundNumber = const Color.fromARGB(117, 158, 158, 158);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          color: Colors.black,
          child: Padding(
            padding:
                const EdgeInsets.only(right: 10, left: 10, bottom: 10, top: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(height: 130),
                Container(
                  height: 120,
                  width: size.width,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 25),
                  child: Text(
                    valueGestor.number,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: valueGestor.size,
                        fontWeight: FontWeight.w300),
                  ),
                ),
                const Padding(padding: EdgeInsets.all(5)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ButtomCalculator(
                      title: (valueGestor.clear) ? 'c' : 'AC',
                      color: Colors.black,
                      background: Colors.grey,
                      size: 40,
                      width: 80,
                    ),
                    const SizedBox(width: 16),
                    ButtomCalculator(
                      title: '+/-',
                      color: Colors.black,
                      background: Colors.grey,
                      size: 30,
                      width: 80,
                    ),
                    const SizedBox(width: 16),
                    ButtomCalculator(
                      title: '%',
                      color: Colors.black,
                      background: Colors.grey,
                      size: 30,
                      width: 80,
                    ),
                    const SizedBox(width: 16),
                    ButtomCalculator(
                      title: '/',
                      color: Colors.white,
                      background: Colors.orange,
                      size: 30,
                      width: 80,
                    ),
                  ],
                ),
                const SizedBox(height: 11),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ButtomCalculator(
                      title: '7',
                      color: Colors.white,
                      background: backgroundNumber,
                      size: tamanho,
                      width: 80,
                    ),
                    const SizedBox(width: 16),
                    ButtomCalculator(
                      title: '8',
                      color: Colors.white,
                      background: backgroundNumber,
                      size: tamanho,
                      width: 80,
                    ),
                    const SizedBox(width: 16),
                    ButtomCalculator(
                      title: '9',
                      color: Colors.white,
                      background: backgroundNumber,
                      size: tamanho,
                      width: 80,
                    ),
                    const SizedBox(width: 16),
                    ButtomCalculator(
                      title: 'X',
                      color: Colors.white,
                      background: Colors.orange,
                      size: tamanho,
                      width: 80,
                    ),
                  ],
                ),
                const SizedBox(height: 11),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ButtomCalculator(
                      title: '4',
                      color: Colors.white,
                      background: backgroundNumber,
                      size: tamanho,
                      width: 80,
                    ),
                    const SizedBox(width: 16),
                    ButtomCalculator(
                      title: '5',
                      color: Colors.white,
                      background: backgroundNumber,
                      size: tamanho,
                      width: 80,
                    ),
                    const SizedBox(width: 16),
                    ButtomCalculator(
                      title: '6',
                      color: Colors.white,
                      background: backgroundNumber,
                      size: tamanho,
                      width: 80,
                    ),
                    const SizedBox(width: 16),
                    ButtomCalculator(
                      title: '-',
                      color: Colors.white,
                      background: Colors.orange,
                      size: tamanho,
                      width: 80,
                    ),
                  ],
                ),
                const SizedBox(height: 11),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ButtomCalculator(
                      title: '1',
                      color: Colors.white,
                      background: backgroundNumber,
                      size: tamanho,
                      width: 80,
                    ),
                    const SizedBox(width: 16),
                    ButtomCalculator(
                      title: '2',
                      color: Colors.white,
                      background: backgroundNumber,
                      size: tamanho,
                      width: 80,
                    ),
                    const SizedBox(width: 16),
                    ButtomCalculator(
                      title: '3',
                      color: Colors.white,
                      background: backgroundNumber,
                      size: tamanho,
                      width: 80,
                    ),
                    const SizedBox(width: 16),
                    ButtomCalculator(
                      title: '+',
                      color: Colors.white,
                      background: Colors.orange,
                      size: tamanho,
                      width: 80,
                    ),
                  ],
                ),
                const SizedBox(height: 11),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: backgroundNumber,
                          fixedSize: const Size(174, 80),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                          ),
                        ),
                        onPressed: () {
                          valueGestor.reception('0');
                          valueGestor.spaceEvaluete();
                          valueGestor.sizeEvaluate();
                        },
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: const Padding(
                            padding: EdgeInsets.only(left: 25),
                            child: Text(
                              '0',
                              style: TextStyle(
                                  fontSize: 35,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    ButtomCalculator(
                      title: ',',
                      color: Colors.white,
                      background: backgroundNumber,
                      size: tamanho,
                      width: 80,
                    ),
                    const SizedBox(width: 16),
                    ButtomCalculator(
                      title: '=',
                      color: Colors.white,
                      background: Colors.orange,
                      size: tamanho,
                      width: 80,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
