import 'package:flutter/material.dart';
import '../globals/colors.dart';
import '../globals/dimensions.dart';
import '../globals/constants.dart';
import '../globals/styles.dart';
import '../globals/config.dart';
import 'success.dart';
import '../utils/func.dart';

class Payment extends StatefulWidget {
  final List cart;
  Payment(this.cart);

  State<StatefulWidget> createState() => PaymentState();
}

class PaymentState extends State<Payment> {
  String _selected = MONTHS[0];
  String _selected1 = YEARS[0];
  bool check1 = false;
  bool check2 = false;
  Func f = new Func();

  Widget build(context) {
    return Scaffold(
      backgroundColor: WHITE_PALETTE,
      appBar: AppBar(
          iconTheme: IconThemeData(color: DBLUE_PALETTE),
          centerTitle: false,
          backgroundColor: WHITE_PALETTE,
          bottomOpacity: 0.0,
          elevation: 0.0),
      body: Padding(
          padding: DIM_PAY_PADDING_1,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  PAYMENT_TITLE,
                  style: STYLE_PAY_TITLE,
                ),
                Align(
                    child: Padding(
                        padding: DIM_PAY_PADDING_4,
                        child: Text(
                            CURRENCY + f.numberFormat(f.getSum(widget.cart)),
                            style: STYLE_PAY_AMT))),
                Padding(
                    padding: DIM_PAY_PADDING_2,
                    child: Text(PAYMENT_DESC, style: STYLE_PAY_DESC)),
                Padding(
                    padding: DIM_PAY_PADDING_3,
                    child: Text(CNO, style: STYLE_CNO)),
                Row(children: <Widget>[
                  Container(
                      width: MediaQuery.of(context).size.width *
                          PAY_CONTAINER_WIDTH,
                      child: TextField()),
                  Image.asset(
                    VISA_IMG,
                    width: PAY_IMG_WIDTH,
                    height: PAY_IMG_HEIGHT,
                  )
                ]),
                Padding(
                    padding: DIM_PAY_PADDING_3,
                    child: Text(CNAME, style: STYLE_CNAME)),
                TextField(),
                Padding(
                    padding: DIM_PAY_PADDING_3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            width: MediaQuery.of(context).size.width *
                                PAY_CONTAINER_WIDTH_1,
                            child: Column(
                              children: <Widget>[
                                Text(EMONTH, style: STYLE_EXPIRY),
                                DropdownButton(
                                  value: _selected,
                                  items: MONTHS.map((value) {
                                    return DropdownMenuItem(
                                        value: value,
                                        child: Text(
                                          value,
                                        ));
                                  }).toList(),
                                  onChanged: (newValue) {
                                    print(newValue);
                                    setState(() {
                                      _selected = newValue;
                                    });
                                  },
                                ),
                              ],
                            )),
                        Container(
                            width: MediaQuery.of(context).size.width *
                                PAY_CONTAINER_WIDTH_1,
                            child: Column(
                              children: <Widget>[
                                Text(EYEAR, style: STYLE_EXPIRY),
                                DropdownButton(
                                  value: _selected1,
                                  items: YEARS.map((value) {
                                    return DropdownMenuItem(
                                        value: value,
                                        child: Text(
                                          value,
                                        ));
                                  }).toList(),
                                  onChanged: (newValue) {
                                    print(newValue);
                                    setState(() {
                                      _selected1 = newValue;
                                    });
                                  },
                                ),
                              ],
                            )),
                        Container(
                            width: MediaQuery.of(context).size.width *
                                PAY_CONTAINER_WIDTH_1,
                            child: Column(
                              children: <Widget>[
                                Text(CVV, style: STYLE_EXPIRY),
                                TextField(
                                  maxLength: 3,
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            )),
                      ],
                    )),
                Row(
                  children: <Widget>[
                    Theme(
                        data: ThemeData(unselectedWidgetColor: DBLUE_PALETTE),
                        child: Checkbox(
                          value: check1,
                          onChanged: (bool value) {
                            setState(() {
                              check1 = value;
                            });
                          },
                        )),
                    Text(PAY_CHECK_1),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Theme(
                        data: ThemeData(unselectedWidgetColor: GRAY_PALETTE),
                        child: Checkbox(
                          value: check2,
                          onChanged: (bool value) {
                            setState(() {
                              check2 = value;
                            });
                          },
                        )),
                    Text(
                      PAY_CHECK_2,
                      style: STYLE_CHECK_2,
                    ),
                  ],
                ),
                Padding(
                    padding: DIM_LOC_PADDING_3,
                    child: Align(
                        alignment: Alignment.center,
                        child: Container(
                            width: MediaQuery.of(context).size.width *
                                DIM_LOC_C_WIDTH,
                            height: DIM_LOC_C_HEIGHT,
                            child: RaisedButton(
                              color: DBLUE_PALETTE,
                              shape: StadiumBorder(),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Success()));
                              },
                              child:
                                  Text(PAY_BTN_TEXT, style: STYLE_LOC_BTN_TEXT),
                            ))))
              ])),
    );
  }
}
