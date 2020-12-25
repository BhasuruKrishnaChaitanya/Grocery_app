import 'package:flutter/material.dart';
import 'package:grocery_app/providers/Products.dart';
import 'package:grocery_app/providers/categories.dart';
import 'package:grocery_app/widgets/product_tile.dart';
import 'package:provider/provider.dart';

class CatScreen extends StatelessWidget {
  static const routeName = "catScreen";
  @override
  Widget build(BuildContext context) {
    var cat = Provider.of<CategoriesProvider>(context);
    String id = ModalRoute.of(context).settings.arguments;
        var products = Provider.of<ProductsProvider>(context).getProductsByCat(id);

    return Scaffold(
      appBar: AppBar(
        title: Text(cat.getCatName(id)),
      ),
      body:  ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductTile(
                    products[index], products[index].quantity[0]);
              },
            ),
    );
  }
}
