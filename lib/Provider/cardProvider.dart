import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';

class CardProvider extends ChangeNotifier {
  final List<Product> _cart = [];
  List<Product> get cart => _cart;

  void toggleFavorite(Product product) {
    if (_cart.contains(product)) {
     for(Product element in _cart){
       element.quantity = ((element.quantity)! + 1)!;
     }
    } else {
      _cart.add(product);
    }
    notifyListeners();
  }
  incrementt(int index) => _cart[index].quantity! + 1;
  decriment(int index) => _cart[index].quantity! - 1;

  bool isExit(Product product) {
    final isExit = _cart.contains(product);
    return isExit;
  }

  static CardProvider of(BuildContext context, {bool listen = true}) {
    return Provider.of<CardProvider>(
      context,
      listen: listen,
    );
  }
}
