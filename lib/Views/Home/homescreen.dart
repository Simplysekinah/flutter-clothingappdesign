import 'package:clothing_app/Models/product_models.dart';
import 'package:clothing_app/Views/Details/category_screen.dart';
import 'package:clothing_app/Views/Home/Components/carousel_card.dart';
import 'package:clothing_app/Views/Home/Components/product_card.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<ProductModel> tops = getProductsByCategory('Tops');
  List<ProductModel> skirts = getProductsByCategory('Skirts');
  List<ProductModel> trousers = getProductsByCategory('Trousers');
  List<ProductModel> dresses = getProductsByCategory('Dresses');

  void categortySelected(String category, List<ProductModel> products) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => CategoryScreen(category: category, products: products),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(height: 300, child: SlidingImage()),
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  tops.isNotEmpty
                      ? Column(
                        children: [
                          // ✅ Show the first top's name
                          GestureDetector(
                            onDoubleTap:
                                () =>
                                // Handle tap event
                                categortySelected("Tops", tops),
                            child: Image.asset(
                              tops[0].image,
                              width: 120,
                              // height: 150,
                            ),
                          ),
                          // Image.asset(
                          //   tops[0].image,
                          //   width: 120,
                          //   // height: 150,
                          // ), // ✅ Show the first top's image
                          Text(
                            tops[0].name,
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      )
                      : Text("No tops available"),
                  dresses.isNotEmpty
                      ? Column(
                        children: [
                          GestureDetector(
                            onDoubleTap:
                                () =>
                                // Handle tap event
                                categortySelected("Dresses", dresses),
                            child: Image.asset(
                              dresses[0].image,
                              width: 120,
                              // height: 150,
                            ),
                          ), // ✅ Show the first top's image
                          Text(
                            dresses[0].name,
                            style: TextStyle(color: Colors.white),
                          ), // ✅ Show the first top's name
                        ],
                      )
                      : Text("No tops available"),
                  skirts.isNotEmpty
                      ? Column(
                        children: [
                          GestureDetector(
                            onDoubleTap:
                                () =>
                                // Handle tap event
                                categortySelected("Skirts", skirts),
                            child: Image.asset(
                              skirts[0].image,
                              width: 120,
                              // height: 150,
                            ),
                          ), // ✅ Show the first top's image
                          Text(
                            skirts[0].name,
                            style: TextStyle(color: Colors.white),
                          ), // ✅ Show the first top's name
                        ],
                      )
                      : Text("No tops available"),
                  trousers.isNotEmpty
                      ? Column(
                        children: [
                          GestureDetector(
                            onDoubleTap:
                                () =>
                                // Handle tap event
                                categortySelected("Trousers", trousers),
                            child: Image.asset(
                              trousers[0].image,
                              width: 120,
                              height: 100,
                            ),
                          ), // ✅ Show the first top's image
                          Text(
                            trousers[0].name,
                            style: TextStyle(color: Colors.white),
                          ), // ✅ Show the first top's name
                        ],
                      )
                      : Text("No tops available"), // ✅ Handle empty list case
                ],
              ),
            ),
            SizedBox(height: 250, child: ProductCard()),
          ],
        ),
      ),
    );
  }
}
