import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>[
      'Filter',
      'Register Form',
      'BlankPage1',
      'BlankPage2',
      'BlankPage3',
      'BlankPage4'
    ];

    const icons = <IconData>[
      Icons.filter_alt_sharp,
      Icons.app_registration_sharp,
      Icons.running_with_errors_sharp,
      Icons.error,
      Icons.nearby_error_rounded,
      Icons.no_encryption_gmailerrorred_rounded,
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Main Menu'),
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(6, (index) {
          return InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/${index + 1}');
                //ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                //  content: Text('Tap at $index'),
                //));
              },
              child: Container(
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Center(
                    child: ListTile(
                        leading: Icon(icons[index]),
                        title: Text(
                          '${entries[index]}',
                        )
                        //child: Text(
                        //'${entries[index]}',
                        //style: Theme.of(context).textTheme.headline5,
                        ),
                  )));
        }),
      ),
    );
  }
}
