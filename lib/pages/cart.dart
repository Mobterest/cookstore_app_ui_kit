import 'package:flutter/material.dart';
import '../globals/colors.dart';
import '../widgets/cartWithNoItems.dart';
import '../widgets/cartWithItems.dart';

class Cart extends StatefulWidget {
  final List cart;

  Cart(this.cart);
  State<StatefulWidget> createState() => CartState();
}

class CartState extends State<Cart> {
  bool isVisible = false;
  Widget build(context) {
    return Scaffold(
        backgroundColor: WHITE_PALETTE,
        body: (widget.cart.length > 0)
            ? WithItems(widget.cart)
            : NoItems(widget.cart));
  }
}
