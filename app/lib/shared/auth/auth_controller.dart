
import 'package:app/modules/home/home_page.dart';
import 'package:app/modules/login/login_page.dart';
import 'package:flutter/material.dart';

class AuthController {
  var _isAuthenticated = false;
  var _user;

  get user => _user;

  void setUser(var user, BuildContext context) {
    if (user != null) {
      _user = user;
      _isAuthenticated = true;
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      _isAuthenticated = false;
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    }
  }
}
