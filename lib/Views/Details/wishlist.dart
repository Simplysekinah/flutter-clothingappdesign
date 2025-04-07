import 'package:clothing_app/Models/product_models.dart';
import 'package:clothing_app/Providers/cart_provider.dart';
import 'package:clothing_app/Views/Details/cart.dart' as cart_view;
import 'package:clothing_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:clothing_app/Providers/wishlist_provider.dart';
import 'package:provider/provider.dart';

class WishList extends StatefulWidget {
  const WishList({super.key});

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  @override
  Widget build(BuildContext context) {
    var wishlistProvider = Provider.of<WishlistProvider>(context);
    var wishlist = wishlistProvider.wishlist;

    // Corrected way to get the product details
    // List<ProductModel> wishlistProducts =
    //     wishlist.map((productId) => getProductById(productId)).toList();

    List<ProductModel> wishlistProducts =
        wishlist.expand((productId) => getProductById(productId)).toList();
    var cartProvider = Provider.of<CartProvider>(context); // From Providers

    return Scaffold(
      appBar: AppBar(title: const Text("Wishlist")),
      body:
          wishlistProducts.isEmpty
              ? const Center(child: Text("Your wishlist is empty"))
              : Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1, // Number of columns
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 3, // Adjusts item height
                          ),
                      itemCount: wishlistProducts.length,
                      itemBuilder: (context, index) {
                        var product = wishlistProducts[index];

                        return Column(
                          children: [
                            Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                // height: 200,
                                child: Row(
                                  children: [
                                    // Product Image
                                    Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.grey[300],
                                      ),
                                      child: Image.asset(
                                        product.image,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Column(
                                      children: [
                                        Wrap(
                                          direction: Axis.vertical,
                                          children: [
                                            Text(
                                              product.name, // Use product name
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              '\$${product.price.toString()}',
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          spacing: 20,
                                          children: [
                                            Wrap(
                                              direction: Axis.vertical,
                                              children: [
                                                Text(
                                                  product
                                                      .name, // Use product name
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                // SizedBox(height: 5),
                                                Text(
                                                  product
                                                      .name, // Use product name
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            IconButton(
                                              style: ButtonStyle(
                                                padding:
                                                    WidgetStateProperty.all(
                                                      EdgeInsets.symmetric(
                                                        horizontal: 5,
                                                        vertical: 2,
                                                      ),
                                                    ),
                                              ),
                                              onPressed: () {
                                                wishlistProvider.wishlist
                                                    .remove(
                                                      product.id.toString(),
                                                    );
                                                wishlistProvider
                                                    .notifyListeners();
                                                ScaffoldMessenger.of(
                                                  context,
                                                ).showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      "${product.name} removed from wishlist",
                                                    ),
                                                    duration: const Duration(
                                                      seconds: 2,
                                                    ),
                                                  ),
                                                );
                                              },
                                              icon: Icon(
                                                Icons.delete,
                                                color: Colors.red,
                                                size: 30,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      iconColor: mainBG,
                      textStyle: TextStyle(
                        color: mainBG,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    label: Text('Add to Cart', style: TextStyle(color: mainBG)),
                    icon: Icon(Icons.bike_scooter),
                    onPressed: () {
                      if (wishlistProducts.isNotEmpty) {
                        for (var product in wishlistProducts) {
                          cartProvider.addtoCart(product.id.toString());
                        }

                        // Clear the wishlist after adding all items to the cart
                        wishlistProvider.wishlist.clear();
                        wishlistProvider.notifyListeners();

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("All wishlist items added to cart"),
                            duration: const Duration(seconds: 2),
                          ),
                        );

                        // Navigate to CartPage
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => cart_view.CartPage(),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
    );
  }
}
