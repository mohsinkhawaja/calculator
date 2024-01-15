import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'components/buttons.dart';
import 'constants.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var userInput = '';
  var answer = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Align(
                      alignment: Alignment.bottomRight,
                    ),
                    Text(
                      userInput.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      answer.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Buttons(
                        buttonValues: 'AC',
                        onPress: () {
                          userInput = '';
                          answer = '';
                          setState(() {});
                        },
                      ),
                      Buttons(
                        buttonValues: '+/-',
                        onPress: () {
                          userInput += '+/-';
                          setState(() {});
                        },
                      ),
                      Buttons(
                          buttonValues: '%',
                          onPress: () {
                            userInput += '%';
                            setState(() {});
                          }),
                      Buttons(
                          buttonValues: '/',
                          mycolor: Colors.orange,
                          onPress: () {
                            userInput += '/';
                            setState(() {});
                          }),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Buttons(
                        buttonValues: '7',
                        onPress: () {
                          userInput += '7';
                          setState(() {});
                        },
                      ),
                      Buttons(
                        buttonValues: '8',
                        onPress: () {
                          userInput += '8';
                          setState(() {});
                        },
                      ),
                      Buttons(
                          buttonValues: '9',
                          onPress: () {
                            userInput += '9';
                            setState(() {});
                          }),
                      Buttons(
                          buttonValues: 'x',
                          mycolor: Colors.orange,
                          onPress: () {
                            userInput += 'x';
                            setState(() {});
                          }),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Buttons(
                        buttonValues: '4',
                        onPress: () {
                          userInput += '4';
                          setState(() {});
                        },
                      ),
                      Buttons(
                        buttonValues: '5',
                        onPress: () {
                          userInput += '5';
                          setState(() {});
                        },
                      ),
                      Buttons(
                          buttonValues: '6',
                          onPress: () {
                            userInput += '6';
                            setState(() {});
                          }),
                      Buttons(
                          buttonValues: '-',
                          mycolor: Colors.orange,
                          onPress: () {
                            userInput += '-';
                            setState(() {});
                          }),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Buttons(
                        buttonValues: '1',
                        onPress: () {
                          userInput += '1';
                          setState(() {});
                        },
                      ),
                      Buttons(
                        buttonValues: '2',
                        onPress: () {
                          userInput += '2';
                          setState(() {});
                        },
                      ),
                      Buttons(
                          buttonValues: '3',
                          onPress: () {
                            userInput += '3';
                            setState(() {});
                          }),
                      Buttons(
                          buttonValues: '+',
                          mycolor: Colors.orange,
                          onPress: () {
                            userInput += '+';
                            setState(() {});
                          }),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Buttons(
                        buttonValues: '0',
                        onPress: () {
                          userInput += '0';
                          setState(() {});
                        },
                      ),
                      Buttons(
                        buttonValues: '.',
                        onPress: () {
                          userInput += '.';
                          setState(() {});
                        },
                      ),
                      Buttons(
                          buttonValues: 'DEL',
                          onPress: () {
                            userInput =
                                userInput.substring(0, userInput.length - 1);
                            setState(() {});
                          }),
                      Buttons(
                          buttonValues: '=',
                          mycolor: Colors.orange,
                          onPress: () {
                            pressEqual();
                            setState(() {});
                          }),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void pressEqual() {
    String finalUserInput = userInput;
    finalUserInput = userInput.replaceAll('X', '*');
    Parser p = Parser();
    Expression expression = p.parse(finalUserInput);
    ContextModel contextModel = ContextModel();

    double equal = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = equal.toString();
  }
}
