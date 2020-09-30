import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:pruebathikathani/models/auth.dart';
import 'package:pruebathikathani/models/authentication.dart';
import 'package:pruebathikathani/pages/Register.dart';
import 'package:pruebathikathani/screens/home.dart';
import 'package:pruebathikathani/values/colors.dart';
import 'package:pruebathikathani/values/my_colors.dart';
import 'package:pruebathikathani/values/my_fonts.dart';
import 'package:pruebathikathani/widgets/bottom.dart';
import 'package:pruebathikathani/widgets/top.dart';

class Login extends StatefulWidget {
  static const routeName = '/login';
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Map<String, String> _authData = {'email': '', 'password': ''};

  void _showErrorDialog(String msg) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: Text("un error"),
              content: Text(msg),
              actions: <Widget>[
                FlatButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    child: Text('SI'))
              ],
            ));
  }

  Future<void> _submit(String email, String password) async {
    Auth auth = Auth();
    try {
      bool response = await auth.login(email, password);
      if (response) {
        Navigator.pushNamed(context, HomeScreen.routeName);
      }
    } on AuthException catch (e) {
      _showErrorDialog(e.msg);
    }
  }

  bool obscurePassword = true;

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        body: GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              width: size.width,
              child: TopImage(),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              width: size.width,
              child: BottomImage(),
            ),
            SingleChildScrollView(
              child: Container(
                  width: size.width,
                  height: size.height,
                  child: SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 30,
                              height: 30,
                              child: Image.asset("assets/icons/flor1.png"),
                            ),
                            Text(
                              'INICIAR SESIÓN',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: Myfonts.titleFont,
                                fontSize: 30,
                                color: UtilColors.orangeColor,
                              ),
                            ),
                            Container(
                              width: 30,
                              height: 30,
                              child: Image.asset("assets/icons/flor2.png"),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxWidth: 350,
                                  minWidth: 350,
                                ),
                                child: Form(
                                  key: _formkey,
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                            alignment: Alignment.center,
                                            width: 38,
                                            height: 38,
                                            decoration: BoxDecoration(
                                                color: Colors.pinkAccent,
                                                borderRadius:
                                                    BorderRadius.circular(40)),
                                            child: Center(
                                              child: Image.asset(
                                                "assets/icons/person.png",
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            width: size.width - 100,
                                            alignment: Alignment.center,
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                labelText: "Email",
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: MyColors
                                                          .primaryColor),
                                                ),
                                                labelStyle: TextStyle(
                                                    color:
                                                        MyColors.primaryColor),
                                              ),
                                              style: TextStyle(
                                                fontFamily: Myfonts.primaryFont,
                                              ),
                                              controller: emailController,
                                              validator: (String text) {
                                                if (text.contains("@")) {
                                                  return null;
                                                }
                                                return "Correo Invalido";
                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                            alignment: Alignment.center,
                                            width: 40,
                                            height: 40,
                                            child: Center(
                                              child: Image.asset(
                                                "assets/icons/iconpassword.png",
                                                width: 40,
                                                height: 40,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            width: size.width - 100,
                                            alignment: Alignment.center,
                                            child: TextFormField(
                                              obscureText: obscurePassword,
                                              style: TextStyle(
                                                  fontFamily:
                                                      Myfonts.primaryFont),
                                              decoration: InputDecoration(
                                                labelText: "Password",
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: MyColors
                                                          .primaryColor),
                                                ),
                                                labelStyle: TextStyle(
                                                    color:
                                                        MyColors.primaryColor),
                                                suffixIcon: CupertinoButton(
                                                  child: obscurePassword
                                                      ? Image.asset(
                                                          "assets/icons/close_eye.png")
                                                      : Image.asset(
                                                          "assets/icons/open_eye.png"),
                                                  onPressed: () {
                                                    setState(() {
                                                      obscurePassword =
                                                          !obscurePassword;
                                                      print(obscurePassword);
                                                    });
                                                  },
                                                ),
                                              ),
                                              controller: passwordController,
                                              validator: (String text) {
                                                if (text.isNotEmpty &&
                                                    text.length > 5) {
                                                  return null;
                                                }
                                                return "contraseña invalida";
                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                )),
                            SizedBox(
                              height: 40,
                            ),
                            ConstrainedBox(
                              constraints: BoxConstraints(
                                maxWidth: 350,
                                minWidth: 350,
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 50),
                                child: RaisedButton(
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                  padding: EdgeInsets.symmetric(vertical: 17),
                                  color: UtilColors.orangeColor,
                                  onPressed: () {
                                    if (_formkey.currentState.validate()) {
                                      _submit(emailController.text,
                                          passwordController.text);
                                    }
                                  },
                                  child: Text(
                                    "INICIAR SESIÓN",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: Myfonts.primaryFont,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "aun no tienes cuenta?",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black54),
                                ),
                                CupertinoButton(
                                  onPressed: () => Navigator.of(context)
                                      .pushReplacementNamed(
                                          UserRegister.routeName),
                                  child: Text(
                                    "Registrar",
                                    style: TextStyle(
                                        color: Colors.pinkAccent, fontSize: 12),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.08,
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    ));
  }
}
