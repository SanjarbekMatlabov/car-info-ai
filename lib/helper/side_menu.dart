import 'package:flutter/material.dart';

class MenuSideBar extends StatefulWidget {
  const MenuSideBar({super.key});

  @override
  State<MenuSideBar> createState() => _MenuSideBarState();
}

class _MenuSideBarState extends State<MenuSideBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Eshmat"),
            accountEmail: Text("Toshmatov"),
            currentAccountPicture: CircleAvatar(
              child: Icon(Icons.person),
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/menu.png'), fit: BoxFit.cover)),
          ),
          ListTile(
            leading: Icon(
              Icons.list,
              color: Colors.black,
            ),
            title: Text(
              "Vehicle list",
              style: TextStyle(color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Divider(
              height: 1,
              color: Color(0xFF071B50),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Colors.black,
            ),
            title: Text(
              "Settings",
              style: TextStyle(color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Divider(
              height: 1,
              color: Color(0xFF071B50),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.notifications,
              color: Colors.black,
            ),
            title: Text(
              "Notifications",
              style: TextStyle(color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Divider(
              height: 1,
              color: Color(0xFF071B50),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.help,
              color: Colors.black,
            ),
            title: Text(
              "Call center",
              style: TextStyle(color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Divider(
              height: 1,
              color: Color(0xFF071B50),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.edit_document,
              color: Colors.black,
            ),
            title: Text(
              "About program",
              style: TextStyle(color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Divider(
              height: 1,
              color: Color(0xFF071B50),
            ),
          ),
        ],
      ),
    );
  }
}
