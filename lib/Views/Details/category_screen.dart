import 'package:clothing_app/Models/product_models.dart';
import 'package:clothing_app/Views/Details/details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:clothing_app/Providers/details_provider.dart';
import 'package:clothing_app/Providers/wishlist_provider.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatefulWidget {
  final String category;
  final List<ProductModel> products;
  const CategoryScreen({
    super.key,
    required this.category,
    required this.products,
  });

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    var detailsProvider = Provider.of<DetailsProvider>(context);
    var wishlistProvider = Provider.of<WishlistProvider>(context);
    bool isFavourite = wishlistProvider.isInWishlist(
      widget.products[0].id.toString(),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.category} Collection"),
        backgroundColor: Colors.black,
      ),
      body:
          widget.products.isNotEmpty
              ? GridView.builder(
                padding: EdgeInsets.all(16),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 60,
                  childAspectRatio: 0.8,
                ),
                itemCount: widget.products.length,
                itemBuilder: (context, index) {
                  return Expanded(
                    flex: 1,
                    child: Column(
                      spacing: 5,
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            GestureDetector(
                              onDoubleTap: () {
                                print('object');
                                detailsProvider.viewDetails(
                                  widget.products[index].id.toString(),
                                );
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailsPage(),
                                  ),
                                );
                              },
                              child: SizedBox(
                                height: 220,
                                width: 200,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    widget.products[index].image,
                                    fit: BoxFit.cover,
                                  ),
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
                                      wishlistProvider.toggleWishlist(
                                        widget.products[index].id.toString(),
                                      );
                                    },
                                    icon: Icon(
                                      size: 35,
                                      isFavourite
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color:
                                          isFavourite
                                              ? Colors.red
                                              : Colors.black,
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
                            Text(
                              widget.products[index].name,
                              style: const TextStyle(color: Colors.white),
                            ),
                            Text(
                              widget.products[index].price.toString(),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              )
              : Center(
                child: Text("No products available in ${widget.category}"),
              ),
    );
  }
}
