import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Sliders extends StatefulWidget {
  @override
  _SlidersState createState() => _SlidersState();
}

int height = 150;

class _SlidersState extends State<Sliders> {
  int height1 = 150;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'HEIGHT',
          style: TextStyle(fontSize: 20.0),
        ),
        SizedBox(
          height: 5.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              height1.toString(),
              style: TextStyle(fontSize: 20.0),
            ),
            Text(
              'cm',
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
        Slider(
          value: height1.toDouble(),
          min: 120.0,
          max: 200.0,
          onChanged: (double newValue) {
            setState(() {
              height1 = newValue.round();
              height = height1;
            });
          },
        )
      ],
    );
  }
}
