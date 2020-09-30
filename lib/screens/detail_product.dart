import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pruebathikathani/values/my_colors.dart';
import 'package:pruebathikathani/values/my_fonts.dart';
import 'package:pruebathikathani/widgets/bottom.dart';
import 'package:pruebathikathani/widgets/top.dart';

class DetailProductScreen extends StatefulWidget {
  static const routeName = '/detail';
  final String description, imageurl, price;
  DetailProductScreen(this.description, this.imageurl, this.price);

  @override
  _DetailProductScreenState createState() {
    var detailProductScreenState =
        _DetailProductScreenState(description, imageurl, price);
    return detailProductScreenState;
  }
}

class _DetailProductScreenState extends State<DetailProductScreen> {
  int _count = 0;

  final String description, imageurl, price;
  _DetailProductScreenState(this.description, this.imageurl, this.price);
  void _increment() {
    setState(() {
      _count++;
    });
  }

  void _decrement() {
    setState(() {
      if (_count >= 1) {
        _count--;
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // DatabaseReference productref =
    //     FirebaseDatabase.instance.reference().child("Posts").child(id);
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
                child: Column(
                  children: [
                    productInfo(description, imageurl, price),
                    Row(children: [
                      Expanded(child: cardDetailProduct("INFORMACIÓN", ""))
                    ]),
                    Row(children: [
                      Expanded(
                        child: cardDetailProduct("SALUDABLE", ""),
                      )
                    ]),
                    Row(children: [
                      Expanded(
                          child: cardDetailProduct("MARCAS Y PRODUCCIÓN", ""))
                    ]),
                  ],
                ),
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

  Card productInfo(String description, String imageurl, String price) {
    return Card(
      elevation: 0,
      color: Colors.transparent,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Material(
              elevation: 10,
              shape: CircleBorder(),
              clipBehavior: Clip.antiAlias,
              child: Image.network(
                imageurl,
                width: 130,
                height: 130,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox.fromSize(
              size: Size(10, 0),
            ),
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        description,
                        style: TextStyle(
                            color: MyColors.primaryColor, fontSize: 14),
                      ),
                    ),
                    SizedBox.fromSize(
                      size: Size(0, 5),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "S/. ${"$price"}",
                        style: TextStyle(
                            color: MyColors.primaryColor, fontSize: 18),
                      ),
                    ),
                    SizedBox.fromSize(
                      size: Size(0, 10),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Cantidad",
                        style: TextStyle(
                            color: MyColors.primaryColor, fontSize: 12),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          CupertinoButton(
                              child: Image.asset(
                                "assets/images/remove.png",
                                width: 25,
                              ),
                              onPressed: () => _decrement()),
                          Text("$_count"),
                          /*
                        IconButton(
                            icon: Icon(
                              Icons.add_circle,
                              color: MyColors.primaryColor,
                            ),
                            onPressed: null),*/
                          CupertinoButton(
                              child: Image.asset(
                                "assets/images/add.png",
                                width: 25,
                              ),
                              onPressed: () => _increment())
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Card cardDetailProduct(String title, String subtitle) {
    return Card(
      color: MyColors.cardColor,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                title,
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontFamily: Myfonts.titleFont,
                    color: MyColors.primaryColor,
                    fontSize: 16),
              ),
            ),
            SizedBox.fromSize(
              size: Size(0, 10),
            ),
            Text(
              subtitle,
              style: TextStyle(color: MyColors.primaryColor, fontSize: 12),
            ),
            SizedBox.fromSize(
              size: Size(0, 50),
            ),
          ],
        ),
      ),
    );
  }
}
