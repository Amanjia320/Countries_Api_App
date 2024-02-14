// ignore_for_file: equal_keys_in_map, unused_local_variable, prefer_final_fields, non_constant_identifier_names, avoid_print

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AuthProvider with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  setloading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void login(String email, String Password) async {
    setloading(true);
    try {
      Response response =
          await post(Uri.parse('https://reqres.in/api/login'), body: {
        'email': email,
        'password': Password,
      });
      if (response.statusCode == 200) {
        print('Successfull');
        setloading(false);
      } else {
        print('Failed');
        setloading(false);
      }
    } catch (e) {
      e.toString();
      setloading(false);
    }
  }
}
