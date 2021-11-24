

import 'package:flutter/material.dart';

class PopLoading extends StatelessWidget {
  final String text;
  PopLoading({this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * .05,
          right: MediaQuery.of(context).size.width * .05),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(16),
                  width: MediaQuery.of(context).size.width * 0.15,
                  height: MediaQuery.of(context).size.width * 0.15,
                  child: CircularProgressIndicator(),
                ),
                text != null ? Text("loading...",
                    style: TextStyle()
                        .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
                ): Container(width: 1),
              ],
            ),
          )
        ],
      ),
    );
  }
}
