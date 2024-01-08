import 'package:calculator/controllers/provider/value_gestor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ButtomCalculator extends StatefulWidget {
  String title;
  Color color;
  Color background;
  double size;
  double width;
  ButtomCalculator(
      {super.key,
      required this.title,
      required this.color,
      required this.background,
      required this.size,
      required this.width});

  @override
  State<ButtomCalculator> createState() => _ButtomCalculatorState();
}

class _ButtomCalculatorState extends State<ButtomCalculator> {
  @override
  Widget build(BuildContext context) {
    var valueGestor = Provider.of<ValueGestor>(context);

    ButtonStyle style = TextButton.styleFrom(
      backgroundColor: (valueGestor.signal)
          ? (widget.title == valueGestor.selectedSignal)
              ? widget.color
              : widget.background
          : widget.background,
      fixedSize: Size(widget.width, 80),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(40)),
      ),
    );
    return Center(
      child: TextButton(
        style: style,
        onPressed: () {
          valueGestor.reception(widget.title);
          if (valueGestor.signais.contains(widget.title) ||
              valueGestor.result.isNotEmpty) {
          } else {
            valueGestor.spaceEvaluete();
          }

          valueGestor.sizeEvaluate();
        },
        child: Text(
          widget.title,
          style: TextStyle(
              fontSize: widget.size,
              color: (valueGestor.signal)
                  ? (widget.title == valueGestor.selectedSignal)
                      ? widget.background
                      : widget.color
                  : widget.color,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
