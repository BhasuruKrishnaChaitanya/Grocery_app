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
                Padding(
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                                padding:
                                    EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                child: WeightDropDown(widget.prod.quantity,
                                    widget.selected, changeSel)),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.05,
                            ),
                            cart.particularItemCount(widget.prod.id) == 0
                                ? Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: RaisedButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      color: Colors.indigo,
                                      textColor: Colors.white,
                                      child: Text("ADD TO CART"),
                                      onPressed: () {
                                        cart.addToCart(widget.prod.id,
                                            widget.prod.name, widget.selected);
                                        Scaffold.of(context)
                                            .hideCurrentSnackBar();
                                        Scaffold.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text("Item Added to Cart"),
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
                                : ButtonBar(
                                    children: [
                                      Container(
                                        width: 50,
                                        child: FlatButton(
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          color: Theme.of(context).primaryColor,
                                          onPressed: () {
                                            cart.removeFromCart(widget.prod.id);
                                          },
                                          child: Text(
                                            "-",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      FittedBox(
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
                                      Container(
                                        width: 50,
                                        child: RaisedButton(
                                          color: Theme.of(context).primaryColor,
                                          onPressed: () {
                                            cart.addToCart(
                                                widget.prod.id,
                                                widget.prod.name,
                                                widget.selected);
                                          },
                                          child: Text(
                                            "+",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                          ],
                        ),
                      )
                    ],
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
