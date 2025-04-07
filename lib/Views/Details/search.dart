import 'package:clothing_app/Views/Details/category_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:clothing_app/Models/product_models.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
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
      body: GridView.builder(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 60,
          childAspectRatio: 0.8,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: 4, // Adjust the count as needed
        itemBuilder: (context, index) {
          // Replace with your logic to build each grid item
          switch (index) {
            case 0:
              return tops.isNotEmpty
                  ? Column(
                    children: [
                      GestureDetector(
                        onDoubleTap: () => categortySelected("Tops", tops),
                        child: Image.asset(tops[0].image, width: 120),
                      ),
                      Text(tops[0].name, style: TextStyle(color: Colors.white)),
                    ],
                  )
                  : Text("No tops available");
            case 1:
              return dresses.isNotEmpty
                  ? Column(
                    children: [
                      GestureDetector(
                        onDoubleTap:
                            () => categortySelected("Dresses", dresses),
                        child: Image.asset(dresses[0].image, width: 120),
                      ),
                      Text(
                        dresses[0].name,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  )
                  : Text("No dresses available");
            case 2:
              return skirts.isNotEmpty
                  ? Column(
                    children: [
                      GestureDetector(
                        onDoubleTap: () => categortySelected("Skirts", skirts),
                        child: Image.asset(skirts[0].image, width: 120),
                      ),
                      Text(
                        skirts[0].name,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  )
                  : Text("No skirts available");
            case 3:
              return trousers.isNotEmpty
                  ? Column(
                    children: [
                      GestureDetector(
                        onDoubleTap:
                            () => categortySelected("Trousers", trousers),
                        child: Image.asset(
                          trousers[0].image,
                          width: 120,
                          height: 100,
                        ),
                      ),
                      Text(
                        trousers[0].name,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  )
                  : Text("No trousers available");
            default:
              return SizedBox.shrink();
          }
        },
        //   tops.isNotEmpty
        //       ? Column(
        //         children: [
        //           // ✅ Show the first top's name
        //           GestureDetector(
        //             onDoubleTap:
        //                 () =>
        //                 // Handle tap event
        //                 categortySelected("Tops", tops),
        //             child: Image.asset(
        //               tops[0].image,
        //               width: 120,
        //               // height: 150,
        //             ),
        //           ),
        //           // Image.asset(
        //           //   tops[0].image,
        //           //   width: 120,
        //           //   // height: 150,
        //           // ), // ✅ Show the first top's image
        //           Text(
        //             tops[0].name,
        //             style: TextStyle(color: Colors.white),
        //           ),
        //         ],
        //       )
        //       : Text("No tops available"),
        //   dresses.isNotEmpty
        //       ? Column(
        //         children: [
        //           GestureDetector(
        //             onDoubleTap:
        //                 () =>
        //                 // Handle tap event
        //                 categortySelected("Dresses", dresses),
        //             child: Image.asset(
        //               dresses[0].image,
        //               width: 120,
        //               // height: 150,
        //             ),
        //           ), // ✅ Show the first top's image
        //           Text(
        //             dresses[0].name,
        //             style: TextStyle(color: Colors.white),
        //           ), // ✅ Show the first top's name
        //         ],
        //       )
        //       : Text("No tops available"),
        //   skirts.isNotEmpty
        //       ? Column(
        //         children: [
        //           GestureDetector(
        //             onDoubleTap:
        //                 () =>
        //                 // Handle tap event
        //                 categortySelected("Skirts", skirts),
        //             child: Image.asset(
        //               skirts[0].image,
        //               width: 120,
        //               // height: 150,
        //             ),
        //           ), // ✅ Show the first top's image
        //           Text(
        //             skirts[0].name,
        //             style: TextStyle(color: Colors.white),
        //           ), // ✅ Show the first top's name
        //         ],
        //       )
        //       : Text("No tops available"),
        //   trousers.isNotEmpty
        //       ? Column(
        //         children: [
        //           GestureDetector(
        //             onDoubleTap:
        //                 () =>
        //                 // Handle tap event
        //                 categortySelected("Trousers", trousers),
        //             child: Image.asset(
        //               trousers[0].image,
        //               width: 120,
        //               height: 100,
        //             ),
        //           ), // ✅ Show the first top's image
        //           Text(
        //             trousers[0].name,
        //             style: TextStyle(color: Colors.white),
        //           ), // ✅ Show the first top's name
        //         ],
        //       )
        //       : Text("No tops available"), // ✅ Handle empty list case
        // ],
      ),
    );
  }
}
