import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Auth with ChangeNotifier {
  String? token;
  String? userId;
  DateTime expiryDate = DateTime.now();

  bool get isAuth {
    return authCheck != null;
  }

  String? get authCheck {
    if (expiryDate != null &&
        expiryDate.isAfter(DateTime.now()) &&
        token != null) {
      return token;
    }
    return null;
  }

  Future<void> signUp(String? email, String? pass) async {
    final url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyADZotQMj8HJA817WhBuwbuH195iLtE8l8');
    final response = await http.post(
      url,
      body: json.encode(
        {
          'email': email,
          'password': pass,
          'returnSecureToken': true,
        },
      ),
    );
    final responseData = json.decode(response.body);
    token = responseData['idToken'];
    userId = responseData['localId'];
    expiryDate = DateTime.now().add(
      Duration(
        seconds: int.parse(
          responseData['expiresIn'],
        ),
      ),
    );
    print(responseData);
  }

  Future<void> signIn(String? email, String? pass) async {
    final url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyADZotQMj8HJA817WhBuwbuH195iLtE8l8');
    final response = await http.post(
      url,
      body: json.encode(
        {
          'email': email,
          'password': pass,
          'returnSecureToken': true,
        },
      ),
    );
    final responseData = json.decode(response.body);
    token = responseData['idToken'];
    userId = responseData['localId'];
    expiryDate = DateTime.now().add(
      Duration(
        seconds: int.parse(
          responseData['expiresIn'],
        ),
      ),
    );
    notifyListeners();
  }
}
