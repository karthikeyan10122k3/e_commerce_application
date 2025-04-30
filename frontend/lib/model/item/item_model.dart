class Item {
  final String id;
  final String title;
  final String description;
  final double price;
  final int stock;
  final double discountPercentage;
  final double rating;
  final String availabilityStatus;
  final int minimumOrderQuantity;
  final String thumbnail;

  Item({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.stock,
    required this.discountPercentage,
    required this.rating,
    required this.availabilityStatus,
    required this.minimumOrderQuantity,
    required this.thumbnail,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json['id'],
    title: json['title'],
    description: json['description'],
    price: json['price'].toDouble(),
    stock: json['stock'],
    discountPercentage: json['discountPercentage'].toDouble(),
    rating: json['rating'].toDouble(),
    availabilityStatus: json['availabilityStatus'],
    minimumOrderQuantity: json['minimumOrderQuantity'],
    thumbnail: json['thumbnail'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'description': description,
    'price': price,
    'stock': stock,
    'discountPercentage': discountPercentage,
    'rating': rating,
    'availabilityStatus': availabilityStatus,
    'minimumOrderQuantity': minimumOrderQuantity,
    'thumbnail': thumbnail,
  };
}
