import 'package:flutter/material.dart';
import '../globals/colors.dart';
import '../globals/dimensions.dart';
import '../globals/constants.dart';
import '../globals/styles.dart';
import '../globals/config.dart';
import '../app.dart';
import 'recipes.dart';

class Success extends StatefulWidget {
  State<StatefulWidget> createState() => SuccessState();
}

class SuccessState extends State<Success> {
  List cartItems = [];
  Widget build(context) {
    return Scaffold(
        backgroundColor: WHITE_PALETTE,
        body: WillPopScope(
            onWillPop: () async => Future.value(false),
            child: SafeArea(
              child: Padding(
                  padding: DIM_SUX_PADDING_1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        SUX_TITLE,
                        style: STYLE_SUX_TITLE,
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: Image.asset(SUX_IMG,
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height *
                                  DIM_IMG_HEIGHT)),
                      Align(
                          alignment: Alignment.center,
                          child: Text(SUX_SUBTITLE, style: STYLE_SUX_SUBTITLE)),
                      Padding(
                          padding: DIM_SUX_PADDING_2,
                          child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                  width: DIM_SUX_CONTAINER_WIDTH,
                                  child: Text(SUX_DESC,
                                      style: STYLE_SUX_DESC,
                                      textAlign: TextAlign.center)))),
                      Padding(
                          padding: DIM_SUX_PADDING_3,
                          child: Align(
                            alignment: Alignment.center,
                            child: Row(
                              children: <Widget>[
                                Container(
                                    width: MediaQuery.of(context).size.width *
                                        DIM_SUX_C_WIDTH,
                                    height: DIM_SUX_C_HEIGHT,
                                    child: RaisedButton(
                                      color: DBLUE_PALETTE,
                                      shape: StadiumBorder(),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Recipes(cartItems)));
                                      },
                                      child: Text(SUX_BTN_TEXT,
                                          style: STYLE_SUX_BTN_TEXT),
                                    )),
                                SizedBox(
                                  width: DIM_SUX_SBOX_WIDTH,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width *
                                      DIM_SUX_C_WIDTH,
                                  height: DIM_SUX_C_HEIGHT,
                                  child: OutlineButton(
                                      color: DBLUE_PALETTE,
                                      shape: StadiumBorder(),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => App()));
                                      },
                                      child: Text(SUX_BTN_TEXT_1,
                                          style: STYLE_SUX_BTN_TEXT_1),
                                      borderSide:
                                          BorderSide(color: DBLUE_PALETTE)),
                                )
                              ],
                            ),
                          ))
                    ],
                  )),
            )));
  }
}
