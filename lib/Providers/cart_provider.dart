import 'package:flutter/widgets.dart';

class CartProvider extends ChangeNotifier {
  final List<String> _cartlist = [];
  List<String> get cartlist => _cartlist;
  bool inCart(String productId) {
    return _cartlist.contains(productId);
  }

  void addtoCart(String productId) {
    if (_cartlist.contains(productId)) {
      _cartlist.remove(productId);
    } else {
      _cartlist.add(productId);
    }
    notifyListeners();
  }
}
