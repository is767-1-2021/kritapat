import 'package:flutter/material.dart';
import 'package:whatHome/page/faq_page.dart';
import 'package:whatHome/page/favorite_page.dart';
import 'package:whatHome/page/login_screen.dart';
import 'package:whatHome/page/register_page.dart';
import 'package:whatHome/page/filter_page.dart';
import 'package:whatHome/page/search_shop_page.dart';
import 'package:whatHome/page/userprofile_page.dart';
import 'package:whatHome/page/ferris_wheel_page.dart';
import 'package:whatHome/page/order_history_page.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    final name = 'Who This';
    final email = 'WhoIsThis@123.com';
    final urlImage = 'https://c.tenor.com/4cfWwQHvEdkAAAAd/meme.gif';

    return Drawer(
      child: Material(
        color: Colors.green,
        child: ListView(
          children: <Widget>[
            buildHeader(
              urlImage: urlImage,
              name: name,
              email: email,
              onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProfilePage(),
              )),
            ),
            Container(
              padding: padding,
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  buildSearchField(),
                  const SizedBox(height: 24),
                  buildMenuItem(
                    text: 'Log in',
                    icon: Icons.login,
                    onClicked: () =>
                        Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    )),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Registration',
                    icon: Icons.people,
                    onClicked: () =>
                        Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => RegisterPage(),
                    )),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'History',
                    icon: Icons.history,
                    onClicked: () =>
                        Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => OrderHistory(),
                    )),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Search Shop',
                    icon: Icons.analytics,
                    onClicked: () =>
                        Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SearchShopPage(),
                    )),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Favorite Menu',
                    icon: Icons.favorite_border,
                    onClicked: () =>
                        Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => FavoritePage(),
                    )),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Spinning Wheel',
                    icon: Icons.accessible_forward_outlined,
                    onClicked: () =>
                        Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => FerrisWheel(),
                    )),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Filter',
                    icon: Icons.filter_list,
                    onClicked: () =>
                        Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => FilterPage(),
                    )),
                  ),
                  const SizedBox(height: 24),
                  Divider(color: Colors.white70),
                  const SizedBox(height: 24),
                  buildMenuItem(
                    text: 'Setting',
                    icon: Icons.settings,
                    onClicked: () {},
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'FAQ',
                    icon: Icons.question_answer,
                    onClicked: () =>
                        Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => FaqPage(),
                    )),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Logout',
                    icon: Icons.logout,
                    onClicked: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    String urlImage,
    String name,
    String email,
    VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
          child: Row(
            children: [
              CircleAvatar(radius: 30, backgroundImage: NetworkImage(urlImage)),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    email,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
              Spacer(),
              CircleAvatar(
                radius: 20,
                backgroundColor: Color.fromRGBO(30, 60, 168, 1),
                child: Icon(Icons.person_rounded, color: Colors.white),
              )
            ],
          ),
        ),
      );

  Widget buildSearchField() {
    final color = Colors.white;

    return TextField(
      style: TextStyle(color: color),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        hintText: 'Search',
        hintStyle: TextStyle(color: color),
        prefixIcon: Icon(Icons.search, color: color),
        filled: true,
        fillColor: Colors.white12,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
      ),
    );
  }

  Widget buildMenuItem({
    String text,
    IconData icon,
    VoidCallback onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }
}
