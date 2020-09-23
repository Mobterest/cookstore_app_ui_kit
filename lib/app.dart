import 'package:flutter/material.dart';
import 'globals/config.dart';
import 'globals/colors.dart';
import 'pages/signin.dart';

class App extends StatelessWidget {
  Widget build(context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: FONT_FAMILY),
      home: Scaffold(
        body: Signin(),
        backgroundColor: WHITE_PALETTE,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
