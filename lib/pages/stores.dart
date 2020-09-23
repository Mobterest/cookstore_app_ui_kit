import 'package:flutter/material.dart';
import '../globals/colors.dart';
import '../globals/constants.dart';
import '../globals/dimensions.dart';
import '../globals/styles.dart';
import 'payment.dart';

class Stores extends StatefulWidget {
  final List cart;
  Stores(this.cart);

  State<StatefulWidget> createState() => StoresState();
}

class StoresState extends State<Stores> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Widget build(context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
          iconTheme: IconThemeData(color: DBLUE_PALETTE),
          title: Text(
            S_HEADER,
            style: STYLE_STORE_S_HEADER,
          ),
          centerTitle: true,
          backgroundColor: WHITE_PALETTE,
          bottomOpacity: 0.0,
          elevation: 0.0),
      backgroundColor: WHITE_PALETTE,
      body: SingleChildScrollView(
          child: Padding(
              padding: DIM_STORES_PADDING_1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      padding: DIM_STORES_PADDING_2,
                      child: Text(S_HEADER_1, style: STYLE_S_HEADER)),
                  Text(
                    S_DESC_1,
                    style: STYLE_STORE_DESC,
                  ),
                  Text(S_DESC_2, style: STYLE_STORE_DESC),
                  SizedBox(height: STORE_SIZEDBOX_HEIGHT),
                  Divider(thickness: STORE_DIVIDER_THICK),
                  SizedBox(height: STORE_SIZEDBOX_HEIGHT),
                  Padding(
                      padding: DIM_STORES_PADDING_3,
                      child: Text(S_HEADER_2, style: STYLE_S_HEADER)),
                  Text(S_DESC_3, style: STYLE_STORE_DESC),
                  Padding(
                      padding: DIM_STORES_PADDING_4,
                      child: Column(children: <Widget>[
                        TextFormField(
                            autocorrect: true,
                            decoration: InputDecoration(
                              hintText: LOG_CRED_1,
                              prefixIcon: Icon(
                                Icons.email,
                                size: 14,
                                color: DBLUE_PALETTE,
                              ),
                              filled: true,
                              fillColor: WHITE_PALETTE,
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: GRAY_PALETTE, width: 0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: GRAY_PALETTE, width: 0),
                              ),
                            )),
                        TextFormField(
                            obscureText: true,
                            autocorrect: true,
                            decoration: InputDecoration(
                              hintText: LOG_CRED_2,
                              prefixIcon: Icon(
                                Icons.vpn_key,
                                size: 14,
                                color: DBLUE_PALETTE,
                              ),
                              filled: true,
                              fillColor: WHITE_PALETTE,
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: GRAY_PALETTE, width: 0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: GRAY_PALETTE, width: 0),
                              ),
                            ))
                      ])),
                  Align(
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Payment(widget.cart)));
                            },
                            color: DBLUE_PALETTE,
                            child: Text(
                              LOG_BTN,
                              style: STYLE_LOG_BTN,
                            ),
                            shape: StadiumBorder(),
                          )))
                ],
              ))),
    );
  }
}
