class ProductModel {
  final int id;
  final String name;
  final String image;
  final double price;
  final String description;
  final String category; // ✅ Added category field

  ProductModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.description,
    required this.category, // ✅ Required category
  });
}

// ✅ Categorized product list
List<ProductModel> allProducts = [
  // 👕 Tops
  ProductModel(
    id: 1,
    name: 'Casual T-Shirt',
    image: 'assets/Images/top1.png',
    price: 5000.00,
    description: 'Comfortable cotton t-shirt.',
    category: 'Tops',
  ),
  ProductModel(
    id: 2,
    name: 'Stylish Blouse',
    image: 'assets/Images/top2.jpg',
    price: 75.00,
    description: 'Elegant and fashionable blouse.',
    category: 'Tops',
  ),
  ProductModel(
    id: 3,
    name: 'Stylish Blouse',
    image: 'assets/Images/top3.jpg',
    price: 75.00,
    description: 'Elegant and fashionable blouse.',
    category: 'Tops',
  ),
  ProductModel(
    id: 4,
    name: 'Stylish Blouse',
    image: 'assets/Images/top4.jpg',
    price: 75.00,
    description: 'Elegant and fashionable blouse.',
    category: 'Tops',
  ),
  ProductModel(
    id: 5,
    name: 'Stylish Blouse',
    image: 'assets/Images/top5.jpg',
    price: 75.00,
    description: 'Elegant and fashionable blouse.',
    category: 'Tops',
  ),
  ProductModel(
    id: 6,
    name: 'Stylish Blouse',
    image: 'assets/Images/top6.jpg',
    price: 75.00,
    description: 'Elegant and fashionable blouse.',
    category: 'Tops',
  ),
  ProductModel(
    id: 7,
    name: 'Stylish Blouse',
    image: 'assets/Images/top7.jpg',
    price: 75.00,
    description: 'Elegant and fashionable blouse.',
    category: 'Tops',
  ),
  ProductModel(
    id: 8,
    name: 'Stylish Blouse',
    image: 'assets/Images/top8.jpg',
    price: 75.00,
    description: 'Elegant and fashionable blouse.',
    category: 'Tops',
  ),
  ProductModel(
    id: 9,
    name: 'Stylish Blouse',
    image: 'assets/Images/top9.jpg',
    price: 75.00,
    description: 'Elegant and fashionable blouse.',
    category: 'Tops',
  ),

  // 👗 Dresses
  ProductModel(
    id: 10,
    name: 'Summer Dress',
    image: 'assets/Images/dress.png',
    price: 120.00,
    description: 'Lightweight floral summer dress.',
    category: 'Dresses',
  ),
  ProductModel(
    id: 11,
    name: 'Stylish Blouse',
    image: 'assets/Images/dress1.jpg',
    price: 75.00,
    description: 'Elegant and fashionable blouse.',
    category: 'Dresses',
  ),
  ProductModel(
    id: 12,
    name: 'Evening Gown',
    image: 'assets/Images/dress2.jpg',
    price: 300.00,
    description: 'Elegant gown for special occasions.',
    category: 'Dresses',
  ),
  ProductModel(
    id: 13,
    name: 'Stylish Blouse',
    image: 'assets/Images/dress3.jpg',
    price: 75.00,
    description: 'Elegant and fashionable blouse.',
    category: 'Dresses',
  ),
  ProductModel(
    id: 14,
    name: 'Stylish Blouse',
    image: 'assets/Images/dress4.jpg',
    price: 75.00,
    description: 'Elegant and fashionable blouse.',
    category: 'Dresses',
  ),
  ProductModel(
    id: 15,
    name: 'Stylish Blouse',
    image: 'assets/Images/dress5.jpg',
    price: 75.00,
    description: 'Elegant and fashionable blouse.',
    category: 'Dresses',
  ),
  ProductModel(
    id: 16,
    name: 'Stylish Blouse',
    image: 'assets/Images/dress6.jpg',
    price: 75.00,
    description: 'Elegant and fashionable blouse.',
    category: 'Drersses',
  ),

  // 👖 Jeans
  ProductModel(
    id: 17,
    name: 'Skinny Jeans',
    image: 'assets/Images/trouser.png',
    price: 150.00,
    description: 'Trendy skinny fit denim jeans.',
    category: 'Trousers',
  ),
  ProductModel(
    id: 17,
    name: 'Skinny Jeans',
    image: 'assets/Images/trouser1.jpg',
    price: 150.00,
    description: 'Trendy skinny fit denim jeans.',
    category: 'Trousers',
  ),
  ProductModel(
    id: 18,
    name: 'Ripped Jeans',
    image: 'assets/Images/trouser2.jpg',
    price: 180.00,
    description: 'Stylish distressed ripped jeans.',
    category: 'Trousers',
  ),
  ProductModel(
    id: 19,
    name: 'Stylish Blouse',
    image: 'assets/Images/trouser3.jpg',
    price: 75.00,
    description: 'Utility-style cargo pants.',
    category: 'Trousers',
  ),
  ProductModel(
    id: 20,
    name: 'Stylish Blouse',
    image: 'assets/Images/trouser4.jpg',
    price: 75.00,
    description: 'Elegant and fashionable blouse.',
    category: 'Trousers',
  ),
  ProductModel(
    id: 21,
    name: 'Stylish Blouse',
    image: 'assets/Images/trouser5.jpg',
    price: 75.00,
    description: 'Elegant and fashionable blouse.',
    category: 'Trousers',
  ),
  ProductModel(
    id: 21,
    name: 'Stylish Blouse',
    image: 'assets/Images/trouser6.jpg',
    price: 75.00,
    description: 'Perfect for office wear',
    category: 'Trousers',
  ),
  ProductModel(
    id: 23,
    name: 'Stylish Blouse',
    image: 'assets/Images/trouser7.jpg',
    price: 75.00,
    description: 'Elegant and fashionable blouse.',
    category: 'Trousers',
  ),

  // 🩳 Skirts
  ProductModel(
    id: 24,
    name: 'Pleated Skirt',
    image: 'assets/Images/skirts.png',
    price: 90.00,
    description: 'Classic pleated mini skirt.',
    category: 'Skirts',
  ),
  ProductModel(
    id: 25,
    name: 'Denim Skirt',
    image: 'assets/Images/skirts.png',
    price: 110.00,
    description: 'Casual and trendy denim skirt.',
    category: 'Skirts',
  ),
];

// ✅ Filtering products by category
List<ProductModel> getProductsByCategory(String category) {
  return allProducts.where((product) => product.category == category).toList();
}

List<ProductModel> getProductById(String id) {
  return allProducts.where((product) => product.id.toString() == id).toList();
}
