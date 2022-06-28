import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:f_shopping_app/domain/product.dart';

class StProvider extends ChangeNotifier {
  final List<Product> _lista = [
    Product(0, "Toy Carro", 10),
    Product(1, "Toy House", 20)
  ];
  UnmodifiableListView<Product> get lista => UnmodifiableListView(_lista);

  int getTotal() {
    var total = 0;
    var lst = _lista;
    for (var i = 0; i < lst.length; i++) {
      total = total + (lst[i].price.toInt() * lst[i].quantity.toInt());
    }
    return total;
  }

  void increment(Product product) {
    var lst = _lista;
    lst[product.id].quantity = product.quantity + 1;
    notifyListeners();
    getTotal();
  }

  void decrement(Product product) {
    var lst = _lista;
    if (lst[product.id].quantity > 0) {
      lst[product.id].quantity = product.quantity - 1;
    }
    notifyListeners();
    getTotal();
  }
}
