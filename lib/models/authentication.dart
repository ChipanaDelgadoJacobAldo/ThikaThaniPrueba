import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'http_exception.dart';

class Authentication with ChangeNotifier {
  Future<void> Register(String email, String password) async {
    const url =
        "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyCB8Zgbvo6XXfvfv1atsCdGLbNMWO0c8H0";
    try {
      final response = await http.post(url,
          body: json.encode({
            "email": email,
            "password": password,
            "returnSecureToken": true,
          }));
      final responseData = json.decode(response.body);
      // print(responseData);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
    } catch (error) {
      throw error;
    }
  }
}
