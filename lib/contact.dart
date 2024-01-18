import 'package:flutter/material.dart';
import 'package:practice/widgets/appBar.dart';
import 'package:practice/widgets/drawer.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  MyAppBar(
        title: 'Torus',
        customIcon: Icons.menu, // Replace with your custom icon
        customIconOnPressed: () {     
        },
      ),
      drawer: MyDrawer(),
      body:Material(
        
      )
    );
  }
}