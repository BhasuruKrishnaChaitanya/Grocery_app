import 'package:flutter/material.dart';
import '../providers/Categories.dart';
import '../widgets/add_container.dart';
import '../widgets/product_tile.dart';
import '../widgets/categories_card.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Categories> products = [
    Categories(imagesrc: '1.png', name: 'Kurkure'),
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
                  childAspectRatio: MediaQuery.of(context).size.width/MediaQuery.of(context).size.width*0.55,
                  crossAxisCount: 2,
                  crossAxisSpacing: 3,
                  mainAxisSpacing: 3,
                ),
                itemBuilder: (context, index) {
                  return CategoriesCard(
                    product: products[index],
                  );
                },
                itemCount: products.length,
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
                return ProductTile(products[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
