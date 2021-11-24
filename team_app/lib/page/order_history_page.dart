import 'package:flutter/material.dart';
import 'package:whatHome/widget/navigation_drawer_widget.dart';

class OrderHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          endDrawer: NavigationDrawerWidget(),
          appBar: AppBar(
            centerTitle: true,
            title: Text('Order History'),
            leading:
                (ModalRoute.of(context)?.canPop ?? false) ? BackButton() : null,
            backgroundColor: Colors.green[800],
            bottom: TabBar(
              indicatorWeight: 10.0,
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.attractions_outlined),
                  text: "Ferris Wheel History",
                ),
                Tab(
                  icon: Icon(Icons.history_outlined),
                  text: "Paid History",
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              _buildListViewWithName('Ferris Wheel History'),
              _buildListViewWithName('Paid History'),
            ],
          )),
    );
  }

  ListView _buildListViewWithName(String s) {
    return ListView.builder(
        itemBuilder: (context, index) => ListTile(
              title: Text(s + ' $index'),
            ));
  }
}
