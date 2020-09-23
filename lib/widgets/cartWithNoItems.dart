import 'package:flutter/material.dart';
import '../globals/dimensions.dart';
import '../globals/constants.dart';
import '../globals/styles.dart';
import '../globals/colors.dart';
import '../globals/config.dart';
import '../pages/recipes.dart';

class NoItems extends StatefulWidget {
  final List cart;

  NoItems(this.cart);
  State<StatefulWidget> createState() => NoItemsState();
}

class NoItemsState extends State<NoItems> {
  Widget build(context) {
    return SafeArea(
      child: Padding(
          padding: DIM_CART_PADDING_1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                CART_TITLE,
                style: STYLE_CART_TITLE,
              ),
              Align(
                  alignment: Alignment.center,
                  child: Image.asset(CART_IMG,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height *
                          DIM_CART_IMG_HEIGHT)),
              Align(
                  alignment: Alignment.center,
                  child: Text(CART_SUBTITLE, style: STYLE_CART_SUBTITLE)),
              Padding(
                  padding: DIM_CART_PADDING_2,
                  child: Align(
                      alignment: Alignment.center,
                      child: Container(
                          width: DIM_CART_CONTAINER_WIDTH,
                          child: Text(CART_DESC,
                              style: STYLE_CART_DESC,
                              textAlign: TextAlign.center)))),
              Padding(
                  padding: DIM_CART_PADDING_3,
                  child: Align(
                      alignment: Alignment.center,
                      child: Container(
                          width: MediaQuery.of(context).size.width *
                              DIM_CART_C_WIDTH,
                          height: DIM_CART_C_HEIGHT,
                          child: RaisedButton(
                            color: DBLUE_PALETTE,
                            shape: StadiumBorder(),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Recipes(widget.cart)));
                            },
                            child:
                                Text(CART_BTN_TEXT, style: STYLE_CART_BTN_TEXT),
                          ))))
            ],
          )),
    );
  }
}
