class CartProductModel {
  int itemId;
  String title;
  String description;
  int quantity;
  double price;
  int stock;
  double discountPercentage;
  double rating;
  String availabilityStatus;
  int minimumOrderQuantity;
  String thumbnail;

  CartProductModel({
    this.itemId = 0,
    this.title = '',
    this.description = '',
    this.quantity = 0,
    this.price = 0.00,
    this.stock = 0,
    this.discountPercentage = 0.00,
    this.rating = 0.00,
    this.availabilityStatus = '',
    this.minimumOrderQuantity = 0,
    this.thumbnail = '',
  });
}

List<CartProductModel> sampleCartProducts = [
  CartProductModel(
    itemId: 1,
    title: "Essence Mascara Lash Princess",
    description:
        "The Essence Mascara Lash Princess is a popular mascara known for its volumizing and lengthening effects. Achieve dramatic lashes with this long-lasting and cruelty-free formula.",

    price: 9.99,
    discountPercentage: 7.17,
    rating: 4.94,
    stock: 5,
    minimumOrderQuantity: 24,
    availabilityStatus: "Low Stock",

    thumbnail:
        "https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/thumbnail.png",
  ),
  CartProductModel(
    itemId: 2,
    title: "Eyeshadow Palette with Mirror",
    description:
        "The Eyeshadow Palette with Mirror offers a versatile range of eyeshadow shades for creating stunning eye looks. With a built-in mirror, it's convenient for on-the-go makeup application.",

    price: 19.99,
    discountPercentage: 5.5,
    rating: 3.28,
    stock: 44,
    minimumOrderQuantity: 32,
    availabilityStatus: "In Stock",
    thumbnail:
        "https://cdn.dummyjson.com/products/images/beauty/Eyeshadow%20Palette%20with%20Mirror/thumbnail.png",
  ),
  CartProductModel(
    itemId: 3,
    title: "Powder Canister",
    description:
        "The Powder Canister is a finely milled setting powder designed to set makeup and control shine. With a lightweight and translucent formula, it provides a smooth and matte finish.",

    price: 14.99,
    discountPercentage: 18.14,
    rating: 3.82,
    stock: 59,
    minimumOrderQuantity: 25,
    availabilityStatus: "In Stock",

    thumbnail:
        "https://cdn.dummyjson.com/products/images/beauty/Powder%20Canister/thumbnail.png",
  ),
  CartProductModel(
    itemId: 4,
    title: "Red Lipstick",
    description:
        "The Red Lipstick is a classic and bold choice for adding a pop of color to your lips. With a creamy and pigmented formula, it provides a vibrant and long-lasting finish.",
    price: 12.99,
    discountPercentage: 19.03,
    rating: 2.51,
    stock: 68,

    minimumOrderQuantity: 6,
    availabilityStatus: "In Stock",

    thumbnail:
        "https://cdn.dummyjson.com/products/images/beauty/Red%20Lipstick/thumbnail.png",
  ),
  CartProductModel(
    itemId: 5,
    title: "Red Nail Polish",
    description:
        "The Red Nail Polish offers a rich and glossy red hue for vibrant and polished nails. With a quick-drying formula, it provides a salon-quality finish at home.",

    price: 8.99,
    discountPercentage: 2.46,
    rating: 3.91,
    stock: 71,

    minimumOrderQuantity: 46,
    availabilityStatus: "In Stock",

    thumbnail:
        "https://cdn.dummyjson.com/products/images/beauty/Red%20Nail%20Polish/thumbnail.png",
  ),
  CartProductModel(
    itemId: 6,
    title: "Calvin Klein CK One",
    description:
        "CK One by Calvin Klein is a classic unisex fragrance, known for its fresh and clean scent. It's a versatile fragrance suitable for everyday wear.",

    price: 49.99,
    discountPercentage: 0.32,
    rating: 4.85,
    stock: 17,

    minimumOrderQuantity: 20,
    availabilityStatus: "In Stock",

    thumbnail:
        "https://cdn.dummyjson.com/products/images/fragrances/Calvin%20Klein%20CK%20One/thumbnail.png",
  ),
  CartProductModel(
    itemId: 7,
    title: "Chanel Coco Noir Eau De",
    description:
        "Coco Noir by Chanel is an elegant and mysterious fragrance, featuring notes of grapefruit, rose, and sandalwood. Perfect for evening occasions.",

    price: 129.99,
    discountPercentage: 18.64,
    rating: 2.76,
    stock: 41,

    minimumOrderQuantity: 5,
    availabilityStatus: "In Stock",

    thumbnail:
        "https://cdn.dummyjson.com/products/images/fragrances/Chanel%20Coco%20Noir%20Eau%20De/thumbnail.png",
  ),
  CartProductModel(
    itemId: 8,
    title: "Dior J'adore",
    description:
        "J'adore by Dior is a luxurious and floral fragrance, known for its blend of ylang-ylang, rose, and jasmine. It embodies femininity and sophistication.",

    price: 89.99,
    discountPercentage: 17.44,
    rating: 3.31,
    stock: 91,
    minimumOrderQuantity: 8,
    availabilityStatus: "In Stock",

    thumbnail:
        "https://cdn.dummyjson.com/products/images/fragrances/Dior%20J'adore/thumbnail.png",
  ),
];
