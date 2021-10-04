import 'package:flutter/material.dart';

class BottomButtonsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 50,
            width: 50,
            child: Image.network('https://c.tenor.com/T0nbuvPYSL0AAAAd/tennis-drake.gif'),
          ),
         Container(
            height: 50,
            width: 50,
            child: Image.network('https://www.gifcen.com/wp-content/uploads/2021/03/memes-gif-16.gif'),
          ),
          Container(
            height: 50,
            width: 50,
            child: Image.network('https://media2.giphy.com/media/BXjqytvu9bKzCUHdzz/200w.webp?cid=ecf05e470sjmxvvmwuv3x2dofcbsvz2x1ir0p32pazpm69iq&rid=200w.webp&ct=s'),
          ),
          Container(
            height: 50,
            width: 50,
            child: Image.network('https://i.gifer.com/embedded/download/Ge2q.gif'),
          ),
          Container(
            height: 50,
            width: 50,
            child: Image.network('https://i.gifer.com/36Vc.gif'),
          ),
        ],
      );
}
