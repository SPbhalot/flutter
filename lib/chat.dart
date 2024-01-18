// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
 const  Chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final names = [
    'Sandeep',
    'rahul',
    'Pawan',
    "Gopal",
  ];

    return Scaffold(
      backgroundColor: Color(0xff1B202D),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18.0, right: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Massages",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white)),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 35,
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Text('Recent',
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                    color: Colors.grey)),
          ),
          SizedBox(height: 10),
          Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18.0),
              child: Row(children: [
                ...names.map((e) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 18.0, bottom: 18.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: CircleAvatar(
                            radius: 20, // Set the radius as per your design
                            backgroundImage: AssetImage(
                                'assets/images/login_image.png'), // Replace with the path to your user image
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text(
                            e,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 10),
                          ),
                        )
                      ],
                    ),
                  );
                }).toList()
              ])),
          Expanded(
            child: Container( 
                padding: EdgeInsetsDirectional.only(top: 18.0, bottom: 18.0),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.elliptical(40, 40),
                        topRight: Radius.elliptical(40, 40))),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 20,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        print(index);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 18.0, right: 18.0, top: 18.0),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius:
                                      20, // Set the radius as per your design
                                  backgroundImage: AssetImage(
                                      'assets/images/login_image.png'), // Replace with the path to your user image
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Name",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.grey,
                                        )),
                                    Text("Name",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10,
                                          color: Colors.grey,
                                        )),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(right: 18.0, top: 18.0),
                              child: Text("2:30 PM",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                    color: Colors.white,
                                  )),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                )),
          )
        ],
      )),
    );
  }
}
