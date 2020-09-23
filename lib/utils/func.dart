import 'package:intl/intl.dart';

class Func {
  Func();

  numberFormat(amount) {
    final formatter = new NumberFormat("#,###");
    return formatter.format(amount);
  }

  getSum(cart) {
    int sum = 0;
    for (var i = 0; i < cart.length; i++) {
      sum += int.parse(cart[i]['price']);
    }
    return sum;
  }
}
