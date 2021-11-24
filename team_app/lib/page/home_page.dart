import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatHome/controllers/what_to_eat_controller.dart';
import 'package:whatHome/data/users.dart';
import 'package:whatHome/model/user.dart';
import '../model/what_to_eat_model.dart';
import '../services/services.dart';
import 'package:whatHome/widget/navigation_drawer_widget.dart';
import 'package:whatHome/provider/feedback_position_provider.dart';
import 'package:whatHome/widget/bottom_buttons_widget.dart';
import 'package:whatHome/widget/user_card_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<User> users = dummyUsers;
  // FirebaseServices services = FirebaseServices();
  WhatToEatController controller = WhatToEatController();
  List<WhatToEatModel> whatToEatList = [];
  bool isLoading = false;

  @override
  Widget build(BuildContext context) => Scaffold(
        endDrawer: NavigationDrawerWidget(),
        appBar: buildAppBar(),
        body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.green[800],
                Colors.green[200],
              ]),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: RefreshIndicator(
            onRefresh: callWhatToEatList,
            child: ListView(
              children: [
                whatToEatList.isEmpty
                    ? Column(
                      children:<Widget>[
                        Image.network('https://thumbs.gfycat.com/UncomfortableInfatuatedFlickertailsquirrel.webp'),
                        Text('No more Food for U',style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: 'OpenSans')),
                        Image.network('https://c.tenor.com/do8q_eYrsW4AAAAd/crying-black-guy-meme.gif'),
                        ],
                        )
                    : isLoading?  CircularProgressIndicator() : Stack(children: whatToEatList.map(buildUser).toList()),
                // Expanded(child: Container()),
                SizedBox(height: 35,),
                BottomButtonsWidget()
              ],
            ),
          ),
        ),
            ),
      );

  Widget buildAppBar() => AppBar(
        centerTitle: true,
        backgroundColor: Colors.green[800],
        elevation: 0,
        leading: (ModalRoute.of(context)?.canPop ?? false) ? BackButton() : null,
        title: Text('What to eat')
        );

  Widget buildUser(WhatToEatModel user) {
    final userIndex = whatToEatList.indexOf(user);
    final isUserInFocus = userIndex == whatToEatList.length - 1;

    return Listener(
      onPointerMove: (pointerEvent) {
        final provider =
            Provider.of<FeedbackPositionProvider>(context, listen: false);
        provider.updatePosition(pointerEvent.localDelta.dx);
      },
      onPointerCancel: (_) {
        final provider =
            Provider.of<FeedbackPositionProvider>(context, listen: false);
        provider.resetPosition();
      },
      onPointerUp: (_) {
        final provider =
            Provider.of<FeedbackPositionProvider>(context, listen: false);
        provider.resetPosition();
      },
      child: Draggable(
        child: UserCardWidget(user: user, isUserInFocus: isUserInFocus),
        feedback: Material(
          type: MaterialType.transparency,
          child: UserCardWidget(user: user, isUserInFocus: isUserInFocus),
        ),
        childWhenDragging: Container(),
        onDragEnd: (details) => onDragEnd(details, user),
      ),
    );
  }

  void onDragEnd(DraggableDetails details, WhatToEatModel user) {
    final minimumDrag = 100;
    if (details.offset.dx > minimumDrag) {
      user.isSwipedOff = true;
    } else if (details.offset.dx < -minimumDrag) {
      user.isLiked = true;
    }

    setState(() => whatToEatList.remove(user));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.onSync
        .listen((bool syncState) => setState(() => isLoading = syncState));
    callWhatToEatList();
    // print(whatToEatList);
  }

  Future<void> callWhatToEatList() async {
     var dataList = await controller.fecthWhatToEatList();
   setState(()  {
     whatToEatList = dataList;
   });
  }
}
