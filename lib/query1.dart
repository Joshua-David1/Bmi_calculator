import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ReusableCard extends StatelessWidget {
  final Color colour;
  final Function onPress;
  final Widget cardChild;

  ReusableCard({@required this.colour, this.cardChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(9.0),
        decoration: BoxDecoration(
          color: this.colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
