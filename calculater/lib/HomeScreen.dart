import 'package:calculater/component/myButton.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userInput = '';
  var answer = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            userInput.toString(),
                            style: const TextStyle(
                                fontSize: 30, color: Colors.white),
                          ),
                        ),
                        Text(
                          answer.toString(),
                          style: const TextStyle(
                              fontSize: 30, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          MyButton(
                            title: 'AC',
                            onPress: () {
                              userInput = '';
                              answer = '';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            onPress: () {
                              userInput += '+/-';
                              setState(() {});
                            },
                            title: '+/-',
                          ),
                          MyButton(
                            onPress: () {
                              userInput += '%';
                              setState(() {});
                            },
                            title: '%',
                          ),
                          MyButton(
                              onPress: () {
                                userInput += '/';
                                setState(() {});
                              },
                              title: '/',
                              color: Color(0xffffa00a)),
                        ],
                      ),
                      Row(
                        children: [
                          MyButton(
                            title: '7',
                            onPress: () {
                              userInput += '7';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            onPress: () {
                              userInput += '8';
                              setState(() {});
                            },
                            title: '8',
                          ),
                          MyButton(
                            onPress: () {
                              userInput += '0';
                              setState(() {});
                            },
                            title: '0',
                          ),
                          MyButton(
                              onPress: () {
                                userInput += '*';
                                setState(() {});
                              },
                              title: 'x',
                              color: Color(0xffffa00a)),
                        ],
                      ),
                      Row(
                        children: [
                          MyButton(
                            title: '4',
                            onPress: () {
                              userInput += '4';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            onPress: () {
                              userInput += '5';
                              setState(() {});
                            },
                            title: '5',
                          ),
                          MyButton(
                            onPress: () {
                              userInput += '6';
                              setState(() {});
                            },
                            title: '6',
                          ),
                          MyButton(
                              onPress: () {
                                userInput += '-';
                                setState(() {});
                              },
                              title: '-',
                              color: Color(0xffffa00a)),
                        ],
                      ),
                      Row(
                        children: [
                          MyButton(
                            title: '1',
                            onPress: () {
                              userInput += '1';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            onPress: () {
                              userInput += '2';
                              setState(() {});
                            },
                            title: '2',
                          ),
                          MyButton(
                            onPress: () {
                              userInput += '3';
                              setState(() {});
                            },
                            title: '3',
                          ),
                          MyButton(
                              onPress: () {
                                userInput += '+';
                                setState(() {});
                              },
                              title: '+',
                              color: Color(0xffffa00a)),
                        ],
                      ),
                      Row(
                        children: [
                          MyButton(
                            title: '0',
                            onPress: () {
                              userInput += '0';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            onPress: () {
                              userInput += '-';
                              setState(() {});
                            },
                            title: '-',
                          ),
                          MyButton(
                            onPress: () {
                              userInput =
                                  userInput.substring(0, userInput.length - 1);
                              setState(() {});
                            },
                            title: 'DEL',
                          ),
                          MyButton(
                              onPress: () {
                                equalPress();
                                setState(() {});
                              },
                              title: '=',
                              color: Color(0xffffa00a)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void equalPress() {
    Parser p = Parser();
    Expression expression = p.parse(userInput);
    ContextModel contextModel = ContextModel();
    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
  }
}
