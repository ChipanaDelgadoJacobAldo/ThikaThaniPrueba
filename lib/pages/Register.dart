import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:pruebathikathani/models/authentication.dart';
import 'package:pruebathikathani/pages/login.dart';
import 'package:pruebathikathani/widgets/top.dart';
import 'package:pruebathikathani/widgets/input_login.dart';

class UserRegister extends StatefulWidget {
  static const routeName = '/register';
  @override
  _UserRegisterState createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  final _formkey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  }

  Map<String, String> _authData = {'email': '', 'password': ''};

  Future<void> _registrar() async {
    if (!_formkey.currentState.validate()) {
      return;
    }
    _formkey.currentState.save();
    await Provider.of<Authentication>(context, listen: false)
        .Register(_authData['email'], _authData['password']);
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
            Positioned(
              right: -size.width * 0.30,
              top: -size.height * 0.20,
              child: TopImage(),
            ),
            Positioned(
              left: -size.width * 0.30,
              top: -size.height * 0.20,
              child: TopImage(),
            ),
            SingleChildScrollView(
              child: Container(
                  width: size.width,
                  height: size.height,
                  child: SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              width: 90,
                              height: 90,
                              margin: EdgeInsets.only(top: size.width * 0.3),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 25,
                                      color: Colors.black26,
                                    )
                                  ]),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Registrar',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Usuario',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            )
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
                                      TextFormField(
                                        decoration:
                                            InputDecoration(labelText: 'Email'),
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        validator: (String text) {
                                          if (text.contains("@")) {
                                            return null;
                                          }
                                          return "Correo Invalido";
                                        },
                                        onSaved: (value) {
                                          _authData["email"] = value;
                                        },
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      TextFormField(
                                        decoration: InputDecoration(
                                            labelText: "Password"),
                                        obscureText: true,
                                        validator: (value) {
                                          if (value.isNotEmpty &&
                                              value.length > 5) {
                                            return null;
                                          }
                                          return "contraseña invalida";
                                        },
                                        onSaved: (value) {
                                          _authData['password'] = value;
                                        },
                                      )
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
                              child: CupertinoButton(
                                borderRadius: BorderRadius.circular(50),
                                padding: EdgeInsets.symmetric(vertical: 17),
                                color: Colors.pinkAccent,
                                onPressed: () => _registrar(),
                                child: Text(
                                  "Registrar",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "ya tienes Cuenta?",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black54),
                                ),
                                CupertinoButton(
                                  onPressed: () => Navigator.of(context)
                                      .pushReplacementNamed(Login.routeName),
                                  child: Text(
                                    "Ingresar",
                                    style: TextStyle(
                                        color: Colors.pinkAccent, fontSize: 12),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.08,
                            )
                          ],
                        )
                      ],
                    ),
                  )),
            ),
            Positioned(
                left: 10,
                top: 10,
                child: SafeArea(
                  child: CupertinoButton(
                    color: Colors.black26,
                    padding: EdgeInsets.all(10),
                    borderRadius: BorderRadius.circular(30),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () => Navigator.of(context)
                        .pushReplacementNamed(Login.routeName),
                  ),
                ))
          ],
        ),
      ),
    ));
  }
}
