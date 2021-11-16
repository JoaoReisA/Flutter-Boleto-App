import 'package:app/shared/auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController {
  final authController = AuthController();
  Future<void> googleSignIn(BuildContext context) async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );
    try {
      final response = await _googleSignIn.signIn();
      authController.setUser(response, context);
      print(response);
    } catch (error) {
      authController.setUser(null, context);
      print(error);
    }
  }
}
