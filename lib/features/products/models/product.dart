enum ProductType { ebook, physical, digital }

class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final double? originalPrice;
  final String mainImage;
  final List<String> additionalImages;
  final ProductType type;
  final double rating;
  final int reviewCount;
  final Map<String, dynamic> metadata;

  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    this.originalPrice,
    required this.mainImage,
    this.additionalImages = const [],
    this.type = ProductType.ebook,
    this.rating = 0.0,
    this.reviewCount = 0,
    this.metadata = const {},
  });

  bool get hasDiscount => originalPrice != null && originalPrice! > price;

  double get discountPercentage {
    if (!hasDiscount) return 0.0;
    return ((originalPrice! - price) / originalPrice!) * 100;
  }
}
