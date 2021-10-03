import 'package:flutter/foundation.dart';

class FirstFormModel extends ChangeNotifier {
  String? _userName;
  String? _password;
  String? _email;

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

  get email => this._email;

  set email(value) {
    this._email = value;
    notifyListeners();
  }
}
