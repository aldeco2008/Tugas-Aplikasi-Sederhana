import 'package:flutter/material.dart';

void main() {
  runApp(Kalkulator());
}

class Kalkulator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String display = "0";

  Widget calcButton(String btnText, Color btnColor, Color txtColor) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        padding: EdgeInsets.all(22),
        backgroundColor: btnColor,
      ),
      onPressed: () {
        setState(() {
          if (btnText == "C") {
            display = "0";
          } else if (btnText == "=") {
            // Add functionality for calculating result here
          } else {
            if (display == "0") {
              display = btnText;
            } else {
              display += btnText;
            }
          }
        });
      },
      child: Text(
        btnText,
        style: TextStyle(
          fontSize: 24,
          color: txtColor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Calculator'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
              child: Text(
                display,
                style: TextStyle(
                  fontSize: 48,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    calcButton("%", Colors.grey, Colors.white),
                    calcButton("CE", Colors.grey, Colors.white),
                    calcButton("C", Colors.grey, Colors.white),
                    calcButton("⌫", Colors.grey, Colors.white),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    calcButton("1/x", Colors.grey, Colors.white),
                    calcButton("x²", Colors.grey, Colors.white),
                    calcButton("²√x", Colors.grey, Colors.white),
                    calcButton("÷", Colors.orange, Colors.white),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    calcButton("7", Colors.grey[850]!, Colors.white),
                    calcButton("8", Colors.grey[850]!, Colors.white),
                    calcButton("9", Colors.grey[850]!, Colors.white),
                    calcButton("×", Colors.orange, Colors.white),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    calcButton("4", Colors.grey[850]!, Colors.white),
                    calcButton("5", Colors.grey[850]!, Colors.white),
                    calcButton("6", Colors.grey[850]!, Colors.white),
                    calcButton("-", Colors.orange, Colors.white),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    calcButton("1", Colors.grey[850]!, Colors.white),
                    calcButton("2", Colors.grey[850]!, Colors.white),
                    calcButton("3", Colors.grey[850]!, Colors.white),
                    calcButton("+", Colors.orange, Colors.white),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    calcButton("+/-", Colors.grey[850]!, Colors.white),
                    calcButton("0", Colors.grey[850]!, Colors.white),
                    calcButton(",", Colors.grey[850]!, Colors.white),
                    calcButton("=", Colors.orange, Colors.white),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
