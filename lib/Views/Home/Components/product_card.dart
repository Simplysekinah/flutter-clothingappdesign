import 'package:clothing_app/Models/product_models.dart';
import 'package:clothing_app/Views/Details/details_page.dart';
// import 'package:clothing_app/Views/Details/Wishlist.dart';
// import 'package:clothing_app/Views/Details/Wishlist.dart';
import 'package:flutter/material.dart';
import 'package:clothing_app/Providers/wishlist_provider.dart';
import 'package:provider/provider.dart';
import 'package:clothing_app/Providers/details_provider.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  List<String> categories = ['Tops', 'Skirts', 'Trousers', 'Dresses'];
  List<String> wishlist = [];
  // Stores IDs of favorite products

  void handleFavouriteToggle(String productId) {
    setState(() {
      if (wishlist.contains(productId)) {
        wishlist.remove(productId); // Remove if already in wishlist
      } else {
        wishlist.add(productId);
        print(productId);
      }
    });
  } // ✅ Missing closing bracket added here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: categories.length, // Ensure correct item count
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (context, index) {
          List<ProductModel> products = getProductsByCategory(
            categories[index],
          );

          // ✅ Ensure there are products before accessing index
          if (products.isEmpty) {
            return const Center(child: Text("No products available"));
          }

          return Column(
            children: [
              TopCard(
                product: products.first, // Use first product instead of `index`
                // onFavouriteToggle: handleFavouriteToggle,
              ),
            ],
          );
        },
      ),
    );
  }
}

class TopCard extends StatelessWidget {
  final ProductModel product;

  const TopCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    var detailsProvider = Provider.of<DetailsProvider>(context);
    var wishlistProvider = Provider.of<WishlistProvider>(context);
    bool isFavourite = wishlistProvider.isInWishlist(product.id.toString());

    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            GestureDetector(
              onDoubleTap: () {
                print('object');
                detailsProvider.viewDetails(product.id.toString());
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailsPage()),
                );
              },
              child: SizedBox(
                height: 220,
                width: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(product.image, fit: BoxFit.cover),
                ),
              ),
            ),
            Positioned(
              top: 5,
              right: 10,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: IconButton(
                    onPressed: () {
                      wishlistProvider.toggleWishlist(product.id.toString());
                    },
                    icon: Icon(
                      size: 35,
                      isFavourite ? Icons.favorite : Icons.favorite_border,
                      color: isFavourite ? Colors.red : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(product.name, style: const TextStyle(color: Colors.white)),
            Text(
              product.price.toString(),
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }
}

// class TopCard extends StatefulWidget {
//   final ProductModel product;
//   final Function(String) onFavouriteToggle;

//   const TopCard({
//     super.key,
//     required this.product,
//     required this.onFavouriteToggle,
//   });

//   @override
//   _TopCardState createState() => _TopCardState();
// }

// class _TopCardState extends State<TopCard> {
//   bool isFavourite = false;
//   List<String> wishlist = [];

//   void toggleFavourite() {
//     setState(() {
//       isFavourite = !isFavourite;
//     });
//     widget.onFavouriteToggle(widget.product.id.toString()); // Pass product ID
//   }

//   @override
//   Widget build(BuildContext context) {
//     var wishlistProvider = Provider.of<WishlistProvider>(context);
//     bool isFavourite = wishlistProvider.isInWishlist(product.id.toString());
//     return Column(
//       children: [
//         Stack(
//           alignment: Alignment.center,
//           children: [
//             SizedBox(
//               height: 220,
//               width: 200,
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(15),
//                 child: Image.asset(widget.product.image, fit: BoxFit.cover),
//               ),
//             ),
//             Positioned(
//               top: 5,
//               right: 10,
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 10,
//                   vertical: 5,
//                 ),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     shape: BoxShape.circle,
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.2),
//                         spreadRadius: 2,
//                         blurRadius: 8,
//                         offset: const Offset(0, 4),
//                       ),
//                     ],
//                   ),
//                   child: IconButton(
//                     onPressed: toggleFavourite,
//                     onLongPress: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => WishList(wishlist: wishlist),
//                         ),
//                       );
//                     },
//                     icon: IconButton(
//                       onPressed: () {
//                         wishlistProvider.toggleWishlist(product.id.toString());
//                       },
//                       icon: Icon(
//                         size: 35,
//                         isFavourite ? Icons.favorite : Icons.favorite_border,
//                         color: isFavourite ? Colors.red : Colors.black,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               widget.product.name,
//               style: const TextStyle(color: Colors.white),
//             ),
//             Text(
//               widget.product.price.toString(),
//               style: const TextStyle(color: Colors.white),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
