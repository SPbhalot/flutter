// ignore_for_file: prefer_const_constructors

import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:practice/routing/routers.dart";
import "package:practice/secure_Store/secureStorage.dart";

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  int _selectedIndex = 0;
  final SecureStorage _secureStorage = SecureStorage();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Move the Navigator.pushNamed call to each onTap handler
    switch (index) {
      case 0:
        break;
      case 1:
        break;
      case 2:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.purple,
            ),
            child: Center(
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.purple),
                accountName: Text(
                  "Sandeep Patidar",
                  style: TextStyle(fontSize: 18),
                ),
                accountEmail: Text("spatidar7865@gmail.com"),
                currentAccountPictureSize: Size.square(50),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text("S",
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.home),
                    title: const Text('Home'),
                    selected: _selectedIndex == 0,
                    onTap: () {
                      _onItemTapped(0);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.chat),
                    title: const Text('Chat'),
                    selected: _selectedIndex == 1,
                    onTap: () {
                      // Update the state of the app and navigate to '/chat'
                      _onItemTapped(1);
                      // Don't close the drawer here
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.contacts),
                    title: const Text('Contact'),
                    selected: _selectedIndex == 2,
                    onTap: () {
                      // Update the state of the app and navigate to '/contact'
                      _onItemTapped(2);
                      // Don't close the drawer here
                    },
                  ),
                ],
              ),
               ListTile(
                    
                    title: const Text('LogOut',style: TextStyle(
                      color:Colors.black,
                      fontSize: 11,
                      fontWeight: FontWeight.normal
                    ),),
                    onTap: () {
                      _secureStorage.DeleteToken();
                      GoRouter.of(context).go(MyAppRouteConstants.login);
                    },
                  ),
            ],
          )
        ],
      ),
    );
  }
}
