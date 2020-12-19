import 'package:flutter/material.dart';
import '../providers/Categories.dart';

class ProductTile extends StatefulWidget {
  final Categories prod;
  ProductTile(this.prod);

  @override
  _ProductTileState createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  @override
  var weight = ['100', '200', '300'];
  var selected = '100';
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      margin: EdgeInsets.all(5),
      child: Card(
        elevation: 3,
        child: Row(
          children: [
            Image.network(
                "https://images-na.ssl-images-amazon.com/images/I/815XvUgtHHL._SX425_.jpg"),
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
                      padding: const EdgeInsets.only(top:2.0),
                      child: DropdownButton(
                        iconSize: 0,
                        selectedItemBuilder: (BuildContext context) {
                          return weight.map<Widget>((String item) {
                            return Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 7),
                                  child: Text(
                                    item + "g",
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(4),
                                      bottomLeft: Radius.circular(4),
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(4),
                                      bottomRight: Radius.circular(4),
                                    ),
                                  ),
                                  padding: EdgeInsets.all(2),
                                  child: Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                )
                              ],
                            );
                          }).toList();
                        },
                        value: selected,
                        onChanged: (value) => setState(() => selected = value),
                        items: weight
                            .map((e) =>
                                DropdownMenuItem(value: e, child: Text(e)))
                            .toList(),
                      )),
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
