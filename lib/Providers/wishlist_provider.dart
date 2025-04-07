import 'package:flutter/material.dart';

class WishlistProvider extends ChangeNotifier {
  final List<String> _wishlist = []; // Stores product IDs

  List<String> get wishlist => _wishlist; // Getter for wishlist

  bool isInWishlist(String productId) {
    return _wishlist.contains(productId);
  }

  void toggleWishlist(String productId) {
    if (_wishlist.contains(productId)) {
      _wishlist.remove(productId); // Remove from wishlist
    } else {
      _wishlist.add(productId); // Add to wishlist
    }
    notifyListeners(); // Notify UI to rebuild
  }
}
