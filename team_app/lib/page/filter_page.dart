import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:whatHome/controllers/filter_controller.dart';
import 'package:whatHome/model/what_to_eat_model.dart';
import 'package:whatHome/widget/navigation_drawer_widget.dart';

class FilterPage extends StatefulWidget {
  FilterPage({Key key, this.title = 'Filter'}) : super(key: key);
  final String title;
  @override
  _FilterPage createState() => _FilterPage();
}

class _FilterPage extends State<FilterPage> {
  List<User> selectedUserList = [];

  List<WhatToEatModel> filterAllList = [];
  List<WhatToEatModel> filterSelectList = [];
  // User selest
  List<WhatToEatModel> filterSelectUserList = [];
  List<WhatToEatModel> listToUpdateFirebase = [];

  FilterController controller = FilterController();
  bool isLoading = false;

  Future<List<WhatToEatModel>> _openFilterDialog() async {
    await FilterListDialog.display<WhatToEatModel>(
      context,
      listData: filterAllList,
      // selectedListData: filterSelectList,
      height: 480,
      headlineText: "Select Menu",
      searchFieldHintText: "Search Here",
      choiceChipLabel: (item) {
        return item.foodName;
      },
      validateSelectedItem: (list, val) {
        return list.contains(val);
      },
      onItemSearch: (list, text) {
        if (list != null) {
          if (list.any((element) =>
              element.foodName.toLowerCase().contains(text.toLowerCase()))) {
            /// return list which contains matches
            return list
                .where((element) =>
                    element.foodName.toLowerCase().contains(text.toLowerCase()))
                .toList();
          }
        }

        return [];
      },
      onApplyButtonClick: (list) {
        List applyList = [];
        List<WhatToEatModel> selectList = [];
        list.forEach((u) {
          if (applyList.contains(u.foodName)) {
            print("duplicate ${u.foodName}");
          } else {
            applyList.add(u.foodName);
            u.complete = true;
            selectList.add(u);
          }
        });
        
        setState(() {
          filterSelectUserList = selectList;
        });
        Navigator.pop(context, filterSelectUserList);
        return filterSelectUserList;
      },
    );
    return filterSelectUserList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: NavigationDrawerWidget(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
        leading:
            (ModalRoute.of(context)?.canPop ?? false) ? BackButton() : null,
        backgroundColor: Colors.green[800],
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          TextButton(
            onPressed: () async {
              var data = await _openFilterDialog();
              filterAllList.forEach((element) { 
                element.complete = false;
                setState(() {
                  listToUpdateFirebase.add(element);
                });
              });
              listToUpdateFirebase.forEach((element) { 
                data.forEach((v) { 
                  if(v.foodName == element.foodName){
                    setState(() {
                      element.complete = true;
                    });
                  }
                });

              });
              await controller.updateFoodList(listToUpdateFirebase);
              getFilterList();
              getFilterSelectList();
            },
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
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: <Widget>[
                filterSelectList == null || filterSelectList.length == 0
                    ? Expanded(
                        child: Center(
                          child: Text('No menu selected'),
                        ),
                      )
                    : Expanded(
                        child: ListView.separated(
                            itemBuilder: (context, index) {
                              var itemfood = filterSelectList[index];
                              return ListTile(
                                title: Text(itemfood.foodName),
                              );
                            },
                            separatorBuilder: (context, index) => Divider(),
                            itemCount: filterSelectList.length),
                      ),
              ],
            ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.onSync
        .listen((bool syncState) => setState(() => isLoading = syncState));
    getFilterList();
    getFilterSelectList();
  }

  Future<void> getFilterList() async {
    var data = await controller.fecthfilterList();
    setState(() {
      filterAllList = data;
    });
  }

  Future<void> getFilterSelectList() async {
    var data = await controller.fecthfilterList();
    data.removeWhere((element) => element.complete == false);
    setState(() {
      filterSelectList = data;
    });
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
