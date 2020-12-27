import 'package:flutter/material.dart';
import 'package:grocery_app/providers/Cart.dart';
import 'package:grocery_app/providers/categories.dart';
import 'package:grocery_app/screens/cart_screen.dart';
import 'package:grocery_app/widgets/badge.dart';
import 'package:grocery_app/widgets/main_drawer.dart';
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
  var searchTerm = new TextEditingController();
  bool search = false;
  var selectedPage = 0;
  void selectPage(index) {
    setState(() {
      selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var prod = Provider.of<ProductsProvider>(context);
    var products = prod.products;
    var categories = Provider.of<CategoriesProvider>(context).categories;
    return Scaffold(
      drawer: Drawer(
        child: MainDrawer(),
      ),
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: Container(
                padding: const EdgeInsets.only(top: 8),
                child: VStack([
                  VxBox().size(27, 3).white.make(),
                  5.heightBox,
                  VxBox().size(40, 3).white.make(),
                  5.heightBox,
                  VxBox().size(20, 3).white.make()
                ]).p12(),
              ),
            );
          },
        ),
        title: Text('MyApp'),
        actions: <Widget>[
          IconButton(
            iconSize: 30,
            icon: Icon(Icons.search),
            onPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
                enableDrag: true,
                context: context,
                // isDismissible: false,
                builder: (builder) {
                  var setproducts = [];
                  return StatefulBuilder(builder: (
                    BuildContext context,
                    StateSetter setState,
                  ) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.8,
                      color: Color(0xFF737373),
                      child: new Container(
                        decoration: new BoxDecoration(
                            color: Colors.white,
                            borderRadius: new BorderRadius.only(
                                topLeft: const Radius.circular(25.0),
                                topRight: const Radius.circular(25.0))),
                        child: ListView(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: IconButton(
                                    iconSize: 30,
                                    icon: Icon(Icons.close),
                                    onPressed: () {
                                      searchTerm.text = '';
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 5.0),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40.0),
                                ),
                                elevation: 2,
                                child: TextField(
                                  autofocus: true,
                                  enabled: true,
                                  onChanged: (value) {
                                    setState(() {
                                      setproducts =
                                          prod.searchProducts(searchTerm.text);
                                      search = true;
                                      print(setproducts.length);
                                    });
                                  },
                                  controller: searchTerm,
                                  decoration: InputDecoration(
                                    // border: InputBorder.none,
                                    fillColor: Colors.white,
                                    filled: true,
                                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20)),),

                                    // border: OutlineInputBorder(
                                    //     borderRadius: BorderRadius.all(
                                    //         Radius.circular(40)),
                                    //     borderSide:
                                    //         BorderSide(color: Colors.white,width: 0)),
                                    hintText: 'Search Products',
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: setproducts.length,
                                itemBuilder: (context, index) {
                                  return ProductTile(setproducts[index],
                                      setproducts[index].quantity[0]);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
                },
              ).then((value) => searchTerm.text = "");
            },
          ),
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Consumer<Cart>(
              builder: (_, cart, ch) => Badge(
                child: ch,
                value: cart.itemCount.toString(),
                color: Colors.deepOrange,
              ),
              child: IconButton(
                iconSize: 28,
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.pushNamed(context, CartScreen.routeName);
                },
              ),
            ),
          ),
        ],
        // bottom: PreferredSize(
        //   preferredSize: const Size.fromHeight(70.0),
        //   child: Padding(
        //     padding: EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 5.0),
        //     child: TextField(
        //       enabled: true,
        //       onChanged: (value) {
        //         print(value);
        //         if (value == "") {
        //           setState(() {
        //             products =
        //                 Provider.of<ProductsProvider>(context, listen: false)
        //                     .products;
        //             search = false;
        //             print(products.length);
        //           });
        //         } else {
        //           setState(() {
        //             setproducts =
        //                 Provider.of<ProductsProvider>(context, listen: false)
        //                     .searchProducts(searchTerm.text);
        //             search = true;
        //             print(setproducts.length);
        //           });
        //         }
        //         print(search);
        //       },
        //       controller: searchTerm,
        //       // expands: false,
        //       decoration: InputDecoration(
        //           fillColor: Colors.white,
        //           filled: true,
        //           border: OutlineInputBorder(),
        //           hintText: 'Enter a search term'),
        //     ),
        //   ),
        // ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
      // bottomNavigationBar: BottomNavigationBar(
      //   onTap: selectPage,
      //   backgroundColor: Theme.of(context).primaryColor,
      //   unselectedItemColor: Colors.white,
      //   selectedItemColor: Colors.pink,
      //   currentIndex: selectedPage,
      //   items: [
      //     BottomNavigationBarItem(
      //       backgroundColor: Theme.of(context).primaryColor,
      //       icon: Icon(Icons.category),
      //       label: "Categories",
      //     ),
      //     BottomNavigationBarItem(
      //       backgroundColor: Theme.of(context).primaryColor,
      //       icon: Icon(Icons.favorite),
      //       label: "Favorites",
      //     )
      //   ],
      // ),
    );
  }
}
