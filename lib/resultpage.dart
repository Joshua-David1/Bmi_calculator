import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'query1.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {@required this.string1, @required this.word2, @required this.word3});
  final String string1;
  final double word2;
  final String word3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'RESULT',
            style: TextStyle(fontSize: 30.0),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Text(
                'Your Result',
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: ReusableCard(
              colour: Colors.black38,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    string1,
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.green,
                    ),
                  ),
                  Text(
                    word2.toStringAsFixed(1),
                    style: TextStyle(
                      fontSize: 50.0,
                    ),
                  ),
                  Text(
                    word3,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: ReusableCard(
            onPress: () {
              Navigator.pop(context);
            },
            colour: Colors.red,
            cardChild: Center(
                child: Text(
              'ReCalculate',
              style: TextStyle(fontSize: 20.0),
            )),
          ))
        ],
      ),
    );
  }
}
