import 'package:flutter/foundation.dart';

class FirstFormModel extends ChangeNotifier {
  String? _userName;
  String? _password;
  int? _age;

  get userName => this._userName;

  set userName(value) {
    this._userName = value;
    notifyListeners();
  }

  get password => this._password;

  set password(value) {
    this._password = value;
    notifyListeners();
  }

  get age => this._age;

  set age(value) {
    this._age = value;
    notifyListeners();
  }
}
