// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar(
      {Key? key,
      required this.title,
      required this.customIcon,
      required this.customIconOnPressed})
      : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(56.0);

  final String title;
  final IconData customIcon;
  final Function() customIconOnPressed;

  get child => null;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: Builder(
        builder: (BuildContext context) {
          return Row(children: [
            InkWell(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Text('Torus',
                    style: TextStyle(
                      color: Colors.blueAccent,
                    )),
              ),
            )
          ]);
        },
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 33,
            height: 33,
            decoration:
                BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
            child: Center(child: const Text('S')),
          ),
        ),
        SvgPicture.asset('assets/images/torusImpectCoin.svg'),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: ClipOval(
              child: Container(
                
                child: SvgPicture.asset(
                  'assets/images/notificationIcon.svg', // Replace with the actual path to your SVG image
                    width:80,
                    height: 80,
                  alignment: Alignment.center,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
