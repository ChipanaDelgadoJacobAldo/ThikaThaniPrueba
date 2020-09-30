import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pruebathikathani/models/products.dart';
import 'package:pruebathikathani/screens/detail_product.dart';
import 'package:pruebathikathani/values/my_colors.dart';

import 'package:pruebathikathani/widgets/bottom.dart';
import 'package:pruebathikathani/widgets/top.dart';
import 'package:firebase_database/firebase_database.dart';

class ListProductsScreen extends StatefulWidget {
  static const routeName = '/list';

  ListProductsScreen({Key key}) : super(key: key);

  @override
  _ListProductsScreenState createState() => _ListProductsScreenState();
}

class _ListProductsScreenState extends State<ListProductsScreen> {
  List<Products> productlist = [];
  @override
  void initState() {
    super.initState();
    DatabaseReference productref =
        FirebaseDatabase.instance.reference().child("Posts");

    productref.once().then((DataSnapshot snapshot) {
      var productkeys = snapshot.value.keys;
      var data = snapshot.value;

      productlist.clear();
      for (var value in snapshot.value.values) {
        print(value);
        //new Text(value);
      }
      for (var individualkey in productkeys) {
        Products products = new Products(
            data[individualkey]['id'],
            data[individualkey]['description'],
            data[individualkey]['postimage'],
            data[individualkey]['price']);

        productlist.add(products);
      }

      setState(() {
        print("tamaño: $productlist.length");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                alignment: Alignment.topCenter,
                width: size.width,
                child: TopImage(),
              ),
              Expanded(
                child: Column(children: [
                  Container(
                    padding: EdgeInsets.only(top: 30),
                    child: Column(
                      children: [
                        Text(
                          "SUPER ALIMENTOS ANDINOS",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "KGBrokeVesselSketch",
                              color: MyColors.primaryColor,
                              fontSize: 20),
                        ),
                        SizedBox.fromSize(
                          size: Size(0, 20),
                        ),
                        Divider(
                          color: MyColors.primaryColor,
                          indent: 50,
                          endIndent: 50,
                          thickness: 3,
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: productlist.length == 0
                        ? new Text("no hay lista \n Cargando....")
                        : ListView.builder(
                            padding: EdgeInsets.only(top: 20),
                            itemCount: productlist.length,
                            itemBuilder: (_, index) {
                              return ProductUI(
                                  productlist[index].id,
                                  productlist[index].description,
                                  productlist[index].postimage,
                                  productlist[index].price);
                            }),
                  ),
                ]),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                width: size.width,
                child: BottomImage(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget ProductUI(
      String id, String description, String imageUrl, String price) {
    return new Card(
      elevation: 0,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Material(
              elevation: 10,
              shape: CircleBorder(),
              clipBehavior: Clip.antiAlias,
              child: Image.network(
                imageUrl,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox.fromSize(
              size: Size(10, 0),
            ),
            Expanded(
              child: Text(
                description,
                style: TextStyle(color: MyColors.primaryColor, fontSize: 14),
              ),
            ),
            Column(
              children: [
                Text(
                  "S/. ${price}",
                  style: TextStyle(color: MyColors.primaryColor, fontSize: 14),
                ),
                CupertinoButton(
                  child: Image.asset(
                    "assets/images/add.png",
                    width: 25,
                  ),
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailProductScreen(
                              description, imageUrl, price))),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
