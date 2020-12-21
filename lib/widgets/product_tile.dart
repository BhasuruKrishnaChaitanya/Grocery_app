import 'package:flutter/material.dart';
import 'package:grocery_app/screens/product_description_screen.dart';
import 'package:grocery_app/widgets/weight_dropdown.dart';
import '../providers/Products.dart';

class ProductTile extends StatefulWidget {
  final Product prod;
  ProductTile(this.prod);

  @override
  _ProductTileState createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  @override
  var weight = ['100', '200', '300'];
  var selected = '100';
  changeSel(val) {
    print(val);
    setState(() {
      selected = val;
    });
  }

  bool showDet = false;
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      margin: EdgeInsets.all(5),
      child: Card(
        elevation: 3,
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
                  "https://images-na.ssl-images-amazon.com/images/I/815XvUgtHHL._SX425_.jpg",
                  width: 120,
                ),
              ),
            ),
            Column(
              children: [
                Text(
                  widget.prod.name,
                  style: Theme.of(context).textTheme.headline5,
                ),
              ],
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(top: 2.0),
                      child: WeightDropDown(weight, selected, changeSel)),
                  RaisedButton(
                    color: Colors.indigo,
                    textColor: Colors.white,
                    child: Text("ADD TO CART"),
                    onPressed: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


