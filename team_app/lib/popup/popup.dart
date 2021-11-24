import 'package:flutter/material.dart';
import 'package:whatHome/popup/pop_loading.dart';
import 'package:whatHome/widget/custom_show_dialog.dart';

class Popup {

    static void showPopLoading(context, String text) {
    Future.delayed(const Duration(milliseconds: 50), () {
      customShowDialog(
          context: context,
          barrierDismissible: false,
          color: Colors.black54,
          builder: (BuildContext context) {
            return PopLoading(text:text);
          }
      );
    });
  }


  static void hidePopupLoading(context) {
    Navigator.of(context).pop();
  }
}