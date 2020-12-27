import 'package:flutter/material.dart';
import 'package:grocery_app/providers/Cart.dart';
import 'package:grocery_app/providers/categories.dart';
import 'package:grocery_app/screens/product_description_screen.dart';
import 'package:grocery_app/widgets/weight_dropdown.dart';
import 'package:provider/provider.dart';
import '../providers/Products.dart';

class ProductTile extends StatefulWidget {
  final Product prod;
  String selected;
  ProductTile(this.prod, this.selected);

  @override
  _ProductTileState createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  changeSel(val) {
    print(val);
    setState(() {
      widget.selected = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    var categories = Provider.of<CategoriesProvider>(context);
    var cart = Provider.of<Cart>(context);

    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.17,
          margin: EdgeInsets.all(5),
          child: Card(
            elevation: 1,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                        ProductDescriptionScreen.routerName,
                        arguments: widget.prod.id);
                  },
                  child: Hero(
                    tag: widget.prod.id,
                    child: Image.network(
                      widget.prod.imagesrc,
                      width: 120,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.64,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                          child: Text(
                            widget.prod.name,
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                          child: Text(
                            categories.getCatName(widget.prod.categoryid),
                            style: TextStyle(color: Colors.grey, fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 0.0),
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                WeightDropDown(widget.prod.quantity,
                                    widget.selected, changeSel),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.05,
                                ),
                                // Sp/acer(),
                                cart.particularItemCount(widget.prod.id) == 0
                                    ? Padding(
                                        padding: const EdgeInsets.all(0.0),
                                        child: RaisedButton.icon(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          color: Colors.indigo,
                                          textColor: Colors.white,
                                          icon: Icon(Icons.add_shopping_cart),
                                          label: Text("ADD"),
                                          onPressed: () {
                                            cart.addToCart(
                                                widget.prod.id,
                                                widget.prod.name,
                                                widget.selected);
                                            Scaffold.of(context)
                                                .hideCurrentSnackBar();
                                            Scaffold.of(context)
                                                .showSnackBar(SnackBar(
                                              content:
                                                  Text("Item Added to Cart"),
                                              duration: Duration(seconds: 2),
                                              action: SnackBarAction(
                                                label: "UNDO",
                                                onPressed: () {
                                                  cart.removeFromCart(
                                                      widget.prod.id);
                                                },
                                              ),
                                            ));
                                          },
                                        ),
                                      )
                                    : Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              cart.removeFromCart(
                                                  widget.prod.id);
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(5),
                                                    bottomLeft:
                                                        Radius.circular(5)),
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              ),
                                              margin: EdgeInsets.all(0),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              width: 30,
                                              child: Text(
                                                "-",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 30,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.all(0),
                                            padding: EdgeInsets.symmetric(
                                                vertical: 4.5, horizontal: 8),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                    width: 1.5)),
                                            child: FittedBox(
                                              child: Text(
                                                cart
                                                    .particularItemCount(
                                                        widget.prod.id)
                                                    .toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline6,
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              cart.addToCart(
                                                  widget.prod.id,
                                                  widget.prod.name,
                                                  widget.selected);
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(5),
                                                    bottomRight:
                                                        Radius.circular(5)),
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              ),
                                              margin: EdgeInsets.all(0),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5, vertical: 3),
                                              width: 30,
                                              child: Text(
                                                "+",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 25,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // Divider(height: 2,thickness: 2,indent: 10,endIndent: 10,)
      ],
    );
  }
}
