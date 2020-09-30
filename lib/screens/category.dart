import 'package:flutter/material.dart';
import 'package:pruebathikathani/screens/list_roducts.dart';
import 'package:pruebathikathani/values/my_colors.dart';
import 'package:pruebathikathani/values/my_fonts.dart';
import 'package:pruebathikathani/widgets/bottom.dart';
import 'package:pruebathikathani/widgets/top.dart';

class CategoryScreen extends StatefulWidget {
  static const routeName = '/category';
  CategoryScreen({Key key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
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
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "THIKA THANI FARMACIA",
                          style: TextStyle(
                              color: MyColors.purpleText,
                              fontFamily: Myfonts.titleFont,
                              fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      _cardCategory(),
                      SizedBox(
                        height: 50,
                      ),
                      _cardCategory1(),
                    ],
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

  _cardCategory() {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: MyColors.cardColor,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, ListProductsScreen.routeName);
        },
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                "SUPER ALIMENTOS ANDINOS, COMPLEMENTOS Y SUPLEMENTOS NUTRICIONALES",
                style: TextStyle(
                  color: MyColors.primaryColor,
                  fontFamily: Myfonts.titleFont,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/product1.png",
                          width: 100,
                          height: 100,
                        ),
                        Text("Superalimentos andinos",
                            style: TextStyle(
                              color: MyColors.primaryColor,
                            ))
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/product2.png",
                          width: 100,
                          height: 100,
                        ),
                        Text("Complementos",
                            style: TextStyle(
                              color: MyColors.primaryColor,
                            ))
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/product3.png",
                          width: 100,
                          height: 100,
                        ),
                        Text("Suplementos",
                            style: TextStyle(
                              color: MyColors.primaryColor,
                            )),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _cardCategory1() {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: MyColors.cardColor,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, ListProductsScreen.routeName);
        },
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                "COSMÉTICA NATURAL Y CUIDADO PERSONAL",
                style: TextStyle(
                  color: MyColors.primaryColor,
                  fontFamily: Myfonts.titleFont,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/product1.png",
                          width: 100,
                          height: 100,
                        ),
                        Text("Jabones naturales",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: MyColors.primaryColor,
                              fontFamily: Myfonts.primaryFont,
                              fontSize: 10,
                            ))
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/product2.png",
                          width: 100,
                          height: 100,
                        ),
                        Text("Aceites esenciales & cremas humectantes",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: MyColors.primaryColor,
                              fontFamily: Myfonts.primaryFont,
                              fontSize: 8,
                            ))
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/product3.png",
                          width: 100,
                          height: 100,
                        ),
                        Text("Cosmetica Natural",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: MyColors.primaryColor,
                              fontFamily: Myfonts.primaryFont,
                              fontSize: 10,
                            )),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/product3.png",
                          width: 100,
                          height: 100,
                        ),
                        Text("cuidado personal",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: MyColors.primaryColor,
                              fontFamily: Myfonts.primaryFont,
                              fontSize: 10,
                            )),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
