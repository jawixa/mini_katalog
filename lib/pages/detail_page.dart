import 'package:flutter/material.dart';

import '../cart.dart';
import '../constants.dart';
import '../models/product.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final p = ModalRoute.of(context)!.settings.arguments as Product;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Geri'),
        actions: [
          ValueListenableBuilder<List<Product>>(
            valueListenable: cart,
            builder: (context, items, _) {
              return IconButton(
                onPressed: () => Navigator.pushNamed(context, '/sepet'),
                icon: Badge(
                  isLabelVisible: items.isNotEmpty,
                  label: Text('${items.length}'),
                  child: const Icon(Icons.shopping_bag_outlined),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                height: 240,
                child: Image.asset(
                  p.image,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stack) =>
                      const Icon(Icons.image_not_supported, size: 80),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              p.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              p.tagline,
              style: const TextStyle(color: AppColors.textMuted),
            ),
            const SizedBox(height: 8),
            Text(
              formatPrice(p.price),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.accent,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Açıklama',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(p.description),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                addToCart(p);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${p.name} sepete eklendi'),
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
              child: const Text('Sepete Ekle'),
            ),
          ],
        ),
      ),
    );
  }
}