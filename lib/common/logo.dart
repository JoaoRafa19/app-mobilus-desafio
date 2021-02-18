import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 60),
        Icon(
          Icons.coronavirus,
          size: 100,
          color: Colors.deepPurple[300],
        ),
        // Text(
        //   '\nCalcular média móvel de mortes por Covid19.',
        //   style: TextStyle(
        //       fontSize: 25,
        //       fontWeight: FontWeight.bold,
        //       fontFamily: 'BigShoulderDisplay'),
        // )
      ],
    );
  }
}
