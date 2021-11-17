
import 'package:app/modules/home/home_page.dart';
import 'package:app/modules/login/login_page.dart';
import 'package:app/shared/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  var _isAuthenticated = false;
  UserModel? _user;

  UserModel get user => _user!;

  void setUser(UserModel? user, BuildContext context) {
    if (user != null) {
      _user = user;
      _isAuthenticated = true;
      Navigator.pushReplacementNamed(
          context,"/home");
    } else {
      _isAuthenticated = false;
            Navigator.pushReplacementNamed(
          context,"/login");
    }
  }

  Future<void> saveUser(UserModel user) async{
    final instance = await SharedPreferences.getInstance();
    await instance.setString("user", user.toJson());
    return;
  }

 Future<void> currentUser(BuildContext context) async {
    final instance = await SharedPreferences.getInstance();
    final json = instance.get("user") as String;
    setUser(UserModel.fromJson(json), context);
    return;
  }
}
