import 'package:flutter/material.dart';
import 'package:grocery_app/providers/categories.dart';
import 'package:grocery_app/screens/cart_screen.dart';
import 'package:provider/provider.dart';
import '../providers/Products.dart';
import '../widgets/add_container.dart';
import '../widgets/product_tile.dart';
import '../widgets/categories_card.dart';
import 'package:velocity_x/velocity_x.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var products = Provider.of<ProductsProvider>(context).products;
    var categories = Provider.of<CategoriesProvider>(context).categories;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {},
          child: VStack([
            VxBox().size(27, 3).white.make(),
            5.heightBox,
            VxBox().size(40, 3).white.make(),
            5.heightBox,
            VxBox().size(20, 3).white.make()
          ]).p12(),
        ),
        title: Text('MyApp'),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(70.0),
          child: Padding(
            padding: EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 5.0),
            child: TextFormField(
              expands: false,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(),
                  hintText: 'Enter a search term'),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Container(
            //   height: MediaQuery.of(context).size.height * 0.3,
            //   margin: EdgeInsets.symmetric(horizontal: 10),
            //   child: ListView.builder(
            //     scrollDirection: Axis.horizontal,
            //     itemCount: 4,
            //     itemBuilder: (context, index) {
            //       return AddContainer();
            //     },
            //   ),
            // ),
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: MediaQuery.of(context).size.width /
                      MediaQuery.of(context).size.width *
                      0.55,
                  crossAxisCount: 2,
                  crossAxisSpacing: 3,
                  mainAxisSpacing: 3,
                ),
                itemBuilder: (context, index) {
                  return CategoriesCard(
                    category: categories[index],
                  );
                },
                itemCount: categories.length,
              ),
            ),
            // Expanded(
            // height: 700,
            // height: double.infinity,
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductTile(
                    products[index], products[index].quantity[0]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
