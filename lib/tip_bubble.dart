import 'package:flutter/material.dart';
import 'package:tipsy/constants.dart';

class TipAmountBubble extends StatelessWidget {
  TipAmountBubble({required this.onTap, required this.textColor, required this.backgroundColor, required this.text});

  final Color textColor;
  final Color backgroundColor; //Required color property
  final String text;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Text(
          this.text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color:this.textColor,
            fontSize: 20,
          ),
        ),
        decoration: BoxDecoration(
          color: this.backgroundColor,
          borderRadius: BorderRadius.circular(20),
          // boxShadow: [BoxShadow(
          //   color:kInactiveTipAmountTextColor,
          //   spreadRadius: 1,
          //   blurRadius: 3,
          //   offset:Offset(0,1),
          // )],
        ),
      ),
    );
  }
}
