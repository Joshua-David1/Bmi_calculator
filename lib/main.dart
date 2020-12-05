import 'package:bmi_calculator/calculation.dart';
import 'package:bmi_calculator/resultpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'query1.dart';
import 'query2.dart';
import 'calculation.dart';
import 'resultpage.dart';

Color inactiveCardcolor = Colors.black12;
Color maleCardcolor = inactiveCardcolor;
Color femaleCardcolor = inactiveCardcolor;
Color activeCardcolor = Colors.black38;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('BMI Calculator'),
          centerTitle: true,
        ),
        body: Working(),
      ),
    );
  }
}

class Working extends StatefulWidget {
  @override
  _WorkingState createState() => _WorkingState();
}

class _WorkingState extends State<Working> {
  int weight = 40;
  int age = 10;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  colour: maleCardcolor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.male,
                        size: 80.0,
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text('Male')
                    ],
                  ),
                  onPress: () {
                    setState(() {
                      if (maleCardcolor == inactiveCardcolor) {
                        maleCardcolor = activeCardcolor;
                        femaleCardcolor = inactiveCardcolor;
                      } else {
                        maleCardcolor = inactiveCardcolor;
                      }
                    });
                  },
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: femaleCardcolor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.female,
                        size: 80.0,
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text('Female')
                    ],
                  ),
                  onPress: () {
                    setState(() {
                      if (femaleCardcolor == inactiveCardcolor) {
                        femaleCardcolor = activeCardcolor;
                        maleCardcolor = inactiveCardcolor;
                      } else {
                        femaleCardcolor = inactiveCardcolor;
                      }
                    });
                  },
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: ReusableCard(
            colour: Colors.black38,
            cardChild: Sliders(),
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Age',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            age.toString(),
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            'Yrs',
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            heroTag: 'ne4',
                            backgroundColor: Colors.white,
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                            child: Icon(
                              Icons.add,
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          FloatingActionButton(
                            heroTag: 'ne3',
                            backgroundColor: Colors.white,
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10.0),
                              child: Icon(
                                Icons.minimize_outlined,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  colour: Colors.black38,
                ),
              ),
              Expanded(
                child: ReusableCard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Weight',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            weight.toString(),
                            style: TextStyle(fontSize: 20.0),
                          ),
                          Text(
                            'Kg',
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            heroTag: 'ne2',
                            backgroundColor: Colors.white,
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 10.0),
                              child: Icon(
                                Icons.minimize_outlined,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          FloatingActionButton(
                            heroTag: 'ne1',
                            backgroundColor: Colors.white,
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Icon(
                                Icons.add,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  colour: Colors.black38,
                ),
              )
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Calculations a = Calculations(weight: weight, height: height);
            double bmi2 = a.bmi1();
            String remarks1 = a.remarks();
            String comment1 = a.comments();
            //Calculations a = Calculations(weight: weight, height: height);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return ResultPage(
                  string1: remarks1,
                  word2: bmi2,
                  word3: comment1,
                );
              }),
            );
          },
          child: Container(
            color: Colors.red,
            height: 50.0,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Calculate',
                  style: TextStyle(fontSize: 20.0),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
