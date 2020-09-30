import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pruebathikathani/screens/category.dart';
import 'package:pruebathikathani/values/my_colors.dart';
import 'package:pruebathikathani/values/my_fonts.dart';
import 'package:pruebathikathani/widgets/bottom.dart';
import 'package:pruebathikathani/widgets/top.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> imagesList = [
    "assets/images/product1.png",
    "assets/images/product2.png",
    "assets/images/product3.png",
    "assets/images/product4.png",
    "assets/images/product5.png",
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                alignment: Alignment.topCenter,
                width: size.width,
                child: TopImage(),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _barButtons(),
                        _searchBar(),
                        Stack(
                          children: [
                            Image.asset("assets/images/options_market.png"),
                            Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(left: 100, top: 60),
                                child: CupertinoButton(
                                  child: Icon(null),
                                  onPressed: () => Navigator.pushNamed(
                                      context, CategoryScreen.routeName),
                                  color: MyColors.transparent,
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "PRODUCTOS DESTACADOS",
                            style: TextStyle(
                                fontFamily: Myfonts.titleFont,
                                fontSize: 20,
                                color: MyColors.primaryColor),
                          ),
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CupertinoButton(
                                  child: Image.asset(
                                      "assets/icons/arrow_left.png"),
                                  onPressed: null),
                              ConstrainedBox(
                                constraints: BoxConstraints(
                                    maxHeight: 100, maxWidth: 220),
                                child: Container(
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: imagesList.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Image.asset(
                                        imagesList[index],
                                        width: 100,
                                        height: 100,
                                      );
                                    },
                                  ),
                                ),
                              ),
                              CupertinoButton(
                                  child: Transform(
                                      transform: Matrix4.rotationY(pi),
                                      child: Image.asset(
                                          "assets/icons/arrow_left.png")),
                                  onPressed: null),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
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

  Widget _barButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset("assets/icons/carrito.png"),
        Image.asset("assets/icons/regalo.png"),
        Image.asset(
          "assets/icons/person.png",
          color: MyColors.primaryColor,
        ),
      ],
    );
  }

  Widget _searchBar() {
    return Container(
      height: 40,
      margin: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: MyColors.searchBoxColor),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          border: InputBorder.none,
        ),
      ),
    );
  }

// falta implementar
  Widget cardrow(String imagen, String description) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: MyColors.cardColor,
      child: Column(
        children: [
          Image.asset(
            imagen,
            width: 100,
            height: 100,
          ),
          Text(description,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: MyColors.primaryColor,
                fontFamily: Myfonts.primaryFont,
                fontSize: 10,
              )),
        ],
      ),
    );
  }
}
