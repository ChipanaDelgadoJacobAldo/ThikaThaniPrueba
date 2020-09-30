import 'package:flutter/material.dart';
import 'package:pruebathikathani/screens/category.dart';
import 'package:pruebathikathani/screens/detail_product.dart';
import 'package:pruebathikathani/screens/list_roducts.dart';
import 'package:pruebathikathani/values/my_colors.dart';
import './screens/home.dart';
import 'pages/login.dart';
import 'pages/Register.dart';
import 'package:provider/provider.dart';
import 'models/authentication.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Authentication(),
        ),
      ],
      child: MaterialApp(
        title: 'Mi Primer App',
        // debugShowCheckedModeBanner: false,
        theme: ThemeData(
          cursorColor: MyColors.primaryColor,
          primarySwatch: Colors.brown,
        ),
        home: Login(),
        routes: {
          Login.routeName: (ctx) => Login(),
          UserRegister.routeName: (ctx) => UserRegister(),
          HomeScreen.routeName: (ctx) => HomeScreen(),
          CategoryScreen.routeName: (ctx) => CategoryScreen(),
          ListProductsScreen.routeName: (ctx) => ListProductsScreen(),
          //DetailProductScreen.routeName: (ctx) => DetailProductScreen(),
        },
      ),
    );
  }
}
