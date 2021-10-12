import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:whatHome/widget/navigation_drawer_widget.dart';

class FilterPage extends StatefulWidget {
  FilterPage({Key key, this.title = 'Filter'}) : super(key: key);
  final String title;
  @override
  _FilterPage createState() => _FilterPage();
}

class _FilterPage extends State<FilterPage> {
  List<User> selectedUserList = [];

  void _openFilterDialog() async {
    await FilterListDialog.display<User>(
      context,
      listData: userList,
      selectedListData: selectedUserList,
      height: 480,
      headlineText: "Select Menu",
      searchFieldHintText: "Search Here",
      choiceChipLabel: (item) {
        return item.name;
      },
      validateSelectedItem: (list, val) {
        return list.contains(val);
      },
      onItemSearch: (list, text) {
        if (list != null) {
          if (list.any((element) =>
              element.name.toLowerCase().contains(text.toLowerCase()))) {
            /// return list which contains matches
            return list
                .where((element) =>
                    element.name.toLowerCase().contains(text.toLowerCase()))
                .toList();
          }
        }

        return [];
      },
      onApplyButtonClick: (list) {
        setState(() {
          selectedUserList = List.from(list);
        });
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text(widget.title),
        leading:
            (ModalRoute.of(context)?.canPop ?? false) ? BackButton() : null,
        backgroundColor: Colors.green[800],
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          TextButton(
            onPressed: _openFilterDialog,
            child: Text(
              "Filter Dialog",
              style: TextStyle(color: Colors.white),
            ),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue)),
            // color: Colors.blue,
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          selectedUserList == null || selectedUserList.length == 0
              ? Expanded(
                  child: Center(
                    child: Text('No menu selected'),
                  ),
                )
              : Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(selectedUserList[index].name),
                        );
                      },
                      separatorBuilder: (context, index) => Divider(),
                      itemCount: selectedUserList.length),
                ),
        ],
      ),
    );
  }
}

class User {
  final String name;
  final String avatar;
  User({this.name, this.avatar});
}

/// Creating a global list for example purpose.
/// Generally it should be within data class or where ever you want
List<User> userList = [
  User(name: "Som Tum", avatar: "user.png"),
  User(name: "Tom Yum Kung", avatar: "user.png"),
  User(name: "Khao Pad", avatar: "user.png"),
  User(name: "Khao Pad Kung", avatar: "user.png"),
  User(name: "Khao Man Kai ", avatar: "user.png"),
  User(name: "Pad Thai", avatar: "user.png"),
  User(name: "Gaeng Keow Wan Kai", avatar: "user.png"),
  User(name: "Khao Niew Ma Muang", avatar: "user.png"),
  User(name: "Pad Kaphrao Moo Saap", avatar: "user.png"),
  User(name: "Tom Kha Kai", avatar: "user.png"),
];
