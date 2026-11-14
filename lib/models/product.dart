class Product {
  final int id;
  final String name;
  final String tagline;
  final double price;
  final String image;
  final String description;

  const Product({
    required this.id,
    required this.name,
    required this.tagline,
    required this.price,
    required this.image,
    required this.description,
  });

  // Map (JSON) -> Product
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      name: json['name'] as String,
      tagline: json['tagline'] as String? ?? '',
      price: (json['price'] as num).toDouble(),
      image: json['image'] as String? ?? '',
      description: json['description'] as String? ?? 'Açıklama yok',
    );
  }

  // Product -> Map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'tagline': tagline,
      'price': price,
      'image': image,
      'description': description,
    };
  }
}