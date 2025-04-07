import 'package:flutter/widgets.dart';

class DetailsProvider extends ChangeNotifier {
  final List<String> _detailslist = [];
  List<String> get detailslist => _detailslist;
  bool inCart(String productId) {
    return _detailslist.contains(productId);
  }

  void viewDetails(String productId) {
    _detailslist.clear();
    _detailslist.add(productId);
    notifyListeners();
  }
}
