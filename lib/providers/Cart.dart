import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final String quantity;
  int count;

  CartItem({
    @required this.id,
    @required this.title,
    @required this.quantity,
    @required this.count,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  int particularItemCount(id) {
    if (_items.containsKey(id)) {
      return _items[id].count;
    }
    
    return 0;
  }



  void addToCart(String id, String title, String quantity) {
    if (_items.containsKey(id)) {
      _items.update(
          id,
          (value) => CartItem(
              id: value.id,
              title: value.title,
              quantity: value.quantity,
              count: value.count + 1));
    } else {
      _items.putIfAbsent(
          id,
          () => CartItem(
              id: DateTime.now().toString(),
              title: title,
              quantity: quantity,
              count: 1));
    }
    notifyListeners();
  }

  void removeFromCart(String id) {
    if (_items.containsKey(id) && _items[id].count > 1) {
      _items.update(
          id,
          (value) => CartItem(
              id: value.id,
              title: value.title,
              quantity: value.quantity,
              count: value.count - 1));
    } else {
      _items.remove(id);
    }
    notifyListeners();
  }

  void removeAllFromCart(String id) {
    _items.remove(id);
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
