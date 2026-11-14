import 'package:flutter/foundation.dart';

import 'models/product.dart';

// Basit sepet: içeriği değişince onu dinleyen ekranlar kendini yeniler.
final ValueNotifier<List<Product>> cart = ValueNotifier<List<Product>>([]);

void addToCart(Product p) {
  // Yeni liste atıyoruz ki ValueNotifier değişikliği fark etsin.
  cart.value = [...cart.value, p];
}

void removeFromCart(int index) {
  final list = [...cart.value];
  list.removeAt(index);
  cart.value = list;
}

void clearCart() {
  cart.value = [];
}