import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatHome/provider/bookmark_model.dart';
import 'package:whatHome/widget/navigation_drawer_widget.dart';

class bookMarkPage extends StatefulWidget {
  const bookMarkPage({Key key}) : super(key: key);

  @override
  _bookMarkPageState createState() => _bookMarkPageState();
}

class _bookMarkPageState extends State<bookMarkPage> {
  @override
  Widget build(BuildContext context) {
    var bookMarkBloc = Provider.of<BookmarkBloc>(context);

    return Scaffold(
      endDrawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text('Bookmarks'),
        leading:
            (ModalRoute.of(context)?.canPop ?? false) ? BackButton() : null,
        backgroundColor: Colors.green[800],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              itemCount: bookMarkBloc.items.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(bookMarkBloc.items[index].title),
                  subtitle: Text(bookMarkBloc.items[index].subtitle),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
