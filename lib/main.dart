import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Home(),
    ));

//Home Page
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Categories> products = [
    Categories(imagesrc: '1.png', name: 'a'),
    Categories(imagesrc: '2.png', name: 'b'),
    Categories(imagesrc: '3.png', name: 'c'),
    Categories(imagesrc: '4.png', name: 'd'),
    Categories(imagesrc: '4.png', name: 'd'),
    Categories(imagesrc: '4.png', name: 'd'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text('MyApp'),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(Icons.shopping_cart),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(70.0),
          child: Padding(
            padding: EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 5.0),
            child: TextField(
              expands: false,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a search term'),
            ),
          ),
        ),
      ),
      body: Container(
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 300,
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return AddContainer();
                },
              ),
            ),
            Container(
              height: 200,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 3 / 2,
                    crossAxisCount: 3,
                    crossAxisSpacing: 3,
                    mainAxisSpacing: 3),
                itemBuilder: (context, index) {
                  return CategoriesCard(
                    product: products[index],
                  );
                },
                itemCount: products.length,
              ),
            ),
            Container(
              height: 250,
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductTIle(products[index]);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Categories {
  String imagesrc;
  String name;
  Categories({this.imagesrc, this.name});
}

class CategoriesCard extends StatelessWidget {
  final Categories product;
  CategoriesCard({this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.indigo,
        margin: EdgeInsets.fromLTRB(6.0, 6.0, 6.0, 0.0),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(product.imagesrc,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                  )),
              SizedBox(height: 6.0),
              Text(product.name,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey[800],
                  )),
            ],
          ),
        ));
  }
}

class AddContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 1, right: 10),
      height: 20,
      width: MediaQuery.of(context).size.width / 2.15,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          color: Colors.deepPurple),
      child: Text(
        "kjhgf",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 24.0,
          color: Colors.white,
        ),
      ),
    );
  }
}

class ProductTIle extends StatelessWidget {
  final Categories prod;
  ProductTIle(this.prod);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      child: ListTile(
        isThreeLine: true,
        subtitle: Text(
          "kjhg",
          style: TextStyle(fontSize: 20),
        ),
        title: Text(
          prod.name,
          style: TextStyle(fontSize: 40),
        ),
        trailing: IconButton(
          icon: Icon(Icons.add_shopping_cart),
          onPressed: () {},
          color: Colors.purple,
          iconSize: 30,
        ),
      ),
    );
  }
}
