import 'package:clothing_app/Models/product_models.dart';
import 'package:clothing_app/Providers/cart_provider.dart';
import 'package:clothing_app/Providers/cart_provider.dart' as providers;
import 'package:clothing_app/Providers/details_provider.dart';
import 'package:clothing_app/Views/Details/cart.dart';
import 'package:clothing_app/constants.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    var detailsProvider = Provider.of<DetailsProvider>(context);
    var cartProvider = Provider.of<providers.CartProvider>(context);
    List<ProductModel> detailsProducts =
        detailsProvider.detailslist
            .expand((productId) => getProductById(productId))
            .toList();
    // var detailsProducts = getProductById(detailsProvider.detailslist);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainBG,
        title: Text('Details', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child:
            detailsProducts.isEmpty
                ? const Text('Details page is empty')
                : Column(
                  children:
                      detailsProducts.map((product) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 500,
                              width: double.infinity,
                              child: ClipRRect(
                                child: Image.asset(
                                  product.image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Text(
                              product.name,
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              product.category,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              '\$${product.price}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  'Select Quantity',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: Wrap(
                                    alignment: WrapAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.minimize),
                                      ),
                                      Text('0', textAlign: TextAlign.center),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.add),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton.icon(
                                  onPressed: () {
                                    cartProvider.addtoCart(
                                      product.id.toString(),
                                    );
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CartPage(),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    side: BorderSide(
                                      color: Colors.white,
                                      width: 2.0,
                                      style: BorderStyle.solid,
                                    ),
                                    iconColor: Colors.white,
                                    textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  label: Text(
                                    'Add to cart',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  icon: Icon(Icons.bike_scooter),
                                  // onPressed: () {},
                                ),
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
                                  label: Text(
                                    'Buy Now',
                                    style: TextStyle(color: mainBG),
                                  ),
                                  icon: Icon(Icons.bike_scooter),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ],
                        );
                        // ListTile(
                        //   title: Text(
                        //     product.name,
                        //   ), // Adjust according to your model
                        //   subtitle: Text(
                        //     '\$${product.price}',
                        //   ), // Adjust accordingly
                        // );
                      }).toList(),
                ),
      ),
    );
  }
}
