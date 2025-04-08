class Product {
  final int id;
  final String title;
  final String description;
  final double price;
  final double rating;
  final String image;
  final String category;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
    required this.image,
    required this.category,
  });
}

List<Product> sampleProducts = [
  Product(
    id: 1,
    title: "Lash Princess Mascara",
    description: "Volumizing mascara for dramatic lashes",
    price: 9.99,
    rating: 4.8,
    image: "https://example.com/mascara.jpg",
    category: "Makeup",
  ),
  Product(
    id: 2,
    title: "Hydrating Face Cream",
    description: "24-hour moisture for all skin types",
    price: 24.99,
    rating: 4.5,
    image: "https://example.com/facecream.jpg",
    category: "Skincare",
  ),
  Product(
    id: 3,
    title: "Matte Lipstick - Ruby Red",
    description: "Long-wear, highly pigmented lip color",
    price: 14.99,
    rating: 4.7,
    image: "https://example.com/lipstick.jpg",
    category: "Makeup",
  ),
  Product(
    id: 4,
    title: "Charcoal Face Mask",
    description: "Deep cleansing mask for clear skin",
    price: 19.99,
    rating: 4.3,
    image: "https://example.com/facemask.jpg",
    category: "Skincare",
  ),
  Product(
    id: 5,
    title: "Eyeshadow Palette",
    description: "12 neutral shades for everyday wear",
    price: 29.99,
    rating: 4.9,
    image: "https://example.com/eyeshadow.jpg",
    category: "Makeup",
  ),
  Product(
    id: 6,
    title: "Vitamin C Serum",
    description: "Brightens skin and reduces dark spots",
    price: 34.99,
    rating: 4.6,
    image: "https://example.com/serum.jpg",
    category: "Skincare",
  ),
  Product(
    id: 7,
    title: "Makeup Brush Set",
    description: "10 professional brushes for full face application",
    price: 39.99,
    rating: 4.7,
    image: "https://example.com/brushes.jpg",
    category: "Tools",
  ),
  Product(
    id: 8,
    title: "Coconut Hair Oil",
    description: "Nourishes and repairs damaged hair",
    price: 12.99,
    rating: 4.4,
    image: "https://example.com/hairoil.jpg",
    category: "Haircare",
  ),
];
