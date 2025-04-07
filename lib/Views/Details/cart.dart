import 'package:clothing_app/Models/product_models.dart';
import 'package:clothing_app/Providers/cart_provider.dart';
import 'package:clothing_app/constants.dart';
// import 'package:clothing_app/Providers/details_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:flutter/widgets.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class CartProvider with ChangeNotifier {
  List<String> cartlist = [];

  void addtoCart(String productId) {
    cartlist.add(productId);
  }

  void removeFromCart(String productId) {
    cartlist.remove(productId);
    notifyListeners(); // Notify listeners here
  }

  void clearCart() {
    cartlist.clear();
    notifyListeners(); // Notify listeners here
  }
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);
    var cartlist = cartProvider.cartlist;
    List<ProductModel> cartlistProducts =
        cartlist.expand((productId) => getProductById(productId)).toList();
    return Scaffold(
      appBar: AppBar(title: const Text("Cartlist")),
      body:
          cartlistProducts.isEmpty
              ? const Center(child: Text("Your cartlist is empty"))
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
                      itemCount: cartlistProducts.length,
                      itemBuilder: (context, index) {
                        var product = cartlistProducts[index];

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
                                                cartProvider.removeFromCart(
                                                  product.id.toString(),
                                                );
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
                      if (cartlistProducts.isNotEmpty) {
                        for (var product in cartlistProducts) {
                          cartProvider.addtoCart(product.id.toString());
                        }

                        // Clear the wishlist after adding all items to the cart
                        cartProvider.cartlist.clear();
                        cartProvider.clearCart();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Payment page in progress"),
                            duration: const Duration(seconds: 2),
                          ),
                        );

                        // Navigate to CartPage
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => CartPage()),
                        // );
                      }
                    },
                  ),
                ],
              ),
    );
  }
}
