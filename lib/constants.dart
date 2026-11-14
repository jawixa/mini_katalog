import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF1E3A8A); // AppBar, buton, tema ana rengi
  static const Color accent = Color(0xFFE65100); // Fiyat rengi
  static const Color background = Color(0xFFF4F6FB); // Sayfa arka planı
  static const Color surface = Colors.white; // Kart rengi
  static const Color textMuted = Color(0xFF6B7280); // Soluk yazılar
}

// 7999.5 -> "7.999,50 TL"
String formatPrice(double price) {
  final parts = price.toStringAsFixed(2).split('.');
  final intPart = parts[0];
  final buffer = StringBuffer();
  for (int i = 0; i < intPart.length; i++) {
    final remaining = intPart.length - i;
    buffer.write(intPart[i]);
    if (remaining > 1 && remaining % 3 == 1) buffer.write('.');
  }
  return '${buffer.toString()},${parts[1]} TL';
}