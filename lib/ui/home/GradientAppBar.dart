import 'package:flutter/material.dart';

class GradientAppBar extends StatelessWidget {
  final String title;
  final double barHeight = 66.0;

  final titleStyle = const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w600,
      fontFamily: 'Poppins',
      fontSize: 36.0
  );

  final boxDecoration = BoxDecoration(
      gradient: LinearGradient(
          colors: [
            const Color(0xFF3366FF),
            const Color(0xFF00CCFF),
          ],
          begin: FractionalOffset(0.0, 0.0),
          end: FractionalOffset(1.0, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp
      )
  );

  GradientAppBar(this.title);

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery
      .of(context)
      .padding
      .top;

    return Container(
        height: statusBarHeight + barHeight,
        padding: EdgeInsets.only(top: statusBarHeight),
        decoration: boxDecoration,
        child: Center(
            child: Text(title, style: titleStyle)
        )
    );
  }
}

