import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<User>? selectedUserList = [];

  void _openFilterDialog() async {
    await FilterListDialog.display<User>(
      context,
      listData: userList,
      selectedListData: selectedUserList,
      height: 480,
      headlineText: "Select Menu",
      searchFieldHintText: "Search Here",
      choiceChipLabel: (item) {
        return item!.name;
      },
      validateSelectedItem: (list, val) {
        return list!.contains(val);
      },

      onItemSearch: (list, text) {
        if (list != null) {
          if (list.any((element) =>
              element.name!.toLowerCase().contains(text.toLowerCase()))) {
            /// return list which contains matches
            return list
                .where((element) =>
                    element.name!.toLowerCase().contains(text.toLowerCase()))
                .toList();
          }
        }

        return [];
      },

      onApplyButtonClick: (list) {
        setState(() {
          selectedUserList = List.from(list!);
        });
        Navigator.pop(context);
      },

      /// uncomment below code to create custom choice chip
      /* choiceChipBuilder: (context, item, isSelected) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
                border: Border.all(
              color: isSelected! ? Colors.blue[300]! : Colors.grey[300]!,
            )),
            child: Text(
              item.name,
              style: TextStyle(
                  color: isSelected ? Colors.blue[300] : Colors.grey[300]),
            ),
          );
      },*/
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
// Filter Page Code ***
/*          TextButton(
            onPressed: () async {
              var list = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FilterPage(
                    allTextList: userList,
                    selectedUserList: selectedUserList,
                  ),
                ),
              );
              if (list != null) {
                setState(() {
                  selectedUserList = List.from(list);
                });
              }
            },
            child: Text(
              "Filter Page",
              style: TextStyle(color: Colors.white),
            ),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue)),
          ),
*/
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
          selectedUserList == null || selectedUserList!.length == 0
              ? Expanded(
                  child: Center(
                    child: Text('No menu selected'),
                  ),
                )
              : Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(selectedUserList![index].name!),
                        );
                      },
                      separatorBuilder: (context, index) => Divider(),
                      itemCount: selectedUserList!.length),
                ),
        ],
      ),
    );
  }
}
// Filter Page Code *****
/*class FilterPage extends StatelessWidget {
  const FilterPage({Key? key, this.allTextList, this.selectedUserList})
      : super(key: key);
  final List<User>? allTextList;
  final List<User>? selectedUserList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filter list Page"),
      ),
      body: SafeArea(
        child: FilterListWidget<User>(
          listData: userList,
          selectedListData: selectedUserList,
          hideHeaderText: true,
          onApplyButtonClick: (list) {
            Navigator.pop(context, list);
          },
          choiceChipLabel: (item) {
            /// Used to print text on chip
            return item!.name;
          },
          choiceChipBuilder: (context, item, isSelected) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  border: Border.all(
                color: isSelected! ? Colors.blue[300]! : Colors.grey[300]!,
              )),
              child: Text(item.name),
            );
          },
          validateSelectedItem: (list, val) {
            ///  identify if item is selected or not
            return list!.contains(val);
          },
          onItemSearch: (list, text) {
            /// When text change in search text field then return list containing that text value
            ///
            ///Check if list has value which matchs to text
            if (list!.any((element) =>
                element.name!.toLowerCase().contains(text.toLowerCase()))) {
              /// return list which contains matches
              return list
                  .where((element) =>
                      element.name!.toLowerCase().contains(text.toLowerCase()))
                  .toList();
            }
            return [];
          },
        ),
      ),
    );
  }
}*/

class User {
  final String? name;
  final String? avatar;
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

/// Another exmaple of [FilterListWidget] to filter list of strings
///
/// FilterListWidget<String>(
///   listData: ["One", "Two", "Three", "Four","five","Six","Seven","Eight","Nine","Ten"],
///   selectedListData: ["One", "Three", "Four","Eight","Nine"],
///   hideHeaderText: true,
///   height: MediaQuery.of(context).size.height,
///   // hideHeaderText: true,
///   onApplyButtonClick: (list) {
///     Navigator.pop(context, list);
///   },
///   choiceChipLabel: (item) {
///     /// Used to print text on chip
///     return item;
///   },
///   validateSelectedItem: (list, val) {
///     ///  identify if item is selected or not
///     return list!.contains(val);
///   },
///   onItemSearch: (list, text) {
///     /// When text change in search text field then return list containing that text value
///     ///
///     ///Check if list has value which matchs to text
///     if (list!.any((element) =>
///         element.toLowerCase().contains(text.toLowerCase()))) {
///       /// return list which contains matches
///       return list
///           .where((element) =>
///               element.toLowerCase().contains(text.toLowerCase()))
///           .toList();
///     }
///     return [];
///   },
/// )