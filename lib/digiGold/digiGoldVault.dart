// ignore_for_file: sized_box_for_whitespace, prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:practice/widgets/appBar.dart';
import 'package:practice/widgets/drawer.dart';

class digiGoldVault extends StatelessWidget {
  const digiGoldVault({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(
          title: 'Torus',
          customIcon: Icons.menu, // Replace with your custom icon
          customIconOnPressed: () {
            // Add your custom icon's onPressed logic here
            Scaffold.of(context).openDrawer(); // Example: open the drawer
          },
        ),
        drawer: MyDrawer(),
        body: SingleChildScrollView(child: 
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 20),
            child: Container(
              color: const Color(0x00f1f7ff),
              child: const Text('Investment Summery', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [
                  Color(0xFFF1F7FF),
                  Color(0xFFF5F9FF)
                ]), 
                color: Colors.black, 
                borderRadius: BorderRadius.circular(4)
                ),
                height: 180,
                padding: const EdgeInsets.all(2),
                // color: const Color(0x0ff1f7ff),
                child: const Column(children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Portfolio',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('invested Value'),
                            Text(
                              '66,999',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('Current value'),
                            Text(
                              '66,999',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Unrealised Gain & Loss'),
                            Text(
                              '66,999',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Today’s Gain & Loss',
                              style: TextStyle(),
                            ),
                            Text(
                              '66,999',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ])),
          ),
          const Padding(
            padding: EdgeInsets.all(28.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Gold',style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),),
                        Row(
                          children: [
                            Text('qty', style: TextStyle(color: Colors.grey)),
                            SizedBox(width: 5),
                            Text('15.00gm', style: TextStyle(fontWeight: FontWeight.w600),)
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text('Invested Value', style: TextStyle(color: Colors.grey)),
                            SizedBox(
                              width: 5,
                            ),
                            Text('2,80,00',style: TextStyle(color: Colors.green, fontSize: 18),),
                          ],
                        ),
                        Row(
                          children: [
                            Text('Current Value', style: TextStyle(color: Colors.grey)),
                            SizedBox(
                              width: 5,
                            ),
                            Text('2,80,00',style: TextStyle(color: Colors.green, fontSize: 18),),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                Divider(
                  color: Colors.grey,
                  endIndent: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Silver',style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),),
                        Row(
                          children: [
                            Text('qty', style: TextStyle(color: Colors.grey)),
                            SizedBox(width: 5),
                            Text('15.00gm', style: TextStyle(fontWeight: FontWeight.w600),)
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text('Invested Value', style: TextStyle(color: Colors.grey)),
                            SizedBox(
                              width: 5,
                            ),
                            Text('2,80,00',style: TextStyle(color: Colors.green, fontSize: 18),),
                          ],
                        ),
                        Row(
                          children: [
                            Text('Current Value', style: TextStyle(color: Colors.grey)),
                            SizedBox(
                              width: 5,
                            ),
                            Text('1,80,00',style: TextStyle(color: Colors.red, fontSize: 18),),
                          ],
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Holdings', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                Text('View more', style: TextStyle(color: Colors.blue),)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:20,right:20,top:10),
            child: Container(
              height: 180,
              width: double.infinity,
              color: Colors.white,
              child: const Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 150,
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.diamond),
                              SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Digital Gold'),
                                  Text('24K . 999 Purity'),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 100,
                          height: 60,
                          // color:Colors.amber,

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Investment(gm)',style: TextStyle(fontSize: 10),),
                              Text('Rs. 768.00',style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                              Text('10.0000gm'),
                            ],
                          ),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 100,
                          height: 60,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('Market Price',style: TextStyle(fontSize: 10),),
                              Text('Rs. 768.00',style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                              Text('2.62(0.23)%',style:TextStyle(color: Colors.green)),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 80,
                          height: 60,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('Current Value',style: TextStyle(fontSize: 10),),
                              Text('Rs. 768.00',style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                              Text('10%', style:TextStyle(color: Colors.green)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:20,right:20,top: 15),
            child: Container(
              height: 180,
              width: double.infinity,
              color: Colors.white,
              child: const Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 150,
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.diamond),
                              SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Digital Gold'),
                                  Text('24K . 999 Purity'),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 100,
                          height: 60,
                          // color:Colors.amber,

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Investment(gm)',style: TextStyle(fontSize: 10),),
                              Text('Rs. 768.00',style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                              Text('10.0000gm'),
                            ],
                          ),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 100,
                          height: 60,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('Market Price',style: TextStyle(fontSize: 10),),
                              Text('Rs. 768.00',style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                              Text('2.62(0.23)%',style:TextStyle(color: Colors.green)),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 80,
                          height: 60,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('Current Value',style: TextStyle(fontSize: 10),),
                              Text('Rs. 768.00',style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                              Text('10%', style:TextStyle(color: Colors.green)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('In-Process Orders', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                Text('View more', style: TextStyle(color: Colors.blue),)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:20,right:20,top:10),
            child: Container(
              height: 180,
              width: double.infinity,
              color: Colors.white,
              child: const Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 150,
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.diamond),
                              SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('1Gm Gold Coin'),
                                  Text('916 Purity'),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 100,
                          height: 60,
                          // color:Colors.amber,

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Order Price(gm)',style: TextStyle(fontSize: 10),),
                              Text('Rs. 768.00',style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                              Text('10.0000gm'),
                            ],
                          ),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 100,
                          height: 60,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [],
                          ),
                        ),
                        SizedBox(
                          width: 80,
                          height: 60,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('Market Price',style: TextStyle(fontSize: 10),),
                              Text('Rs. 768.00',style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                              Text('10%', style:TextStyle(color: Colors.green)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:20,right:20,top: 15),
            child: Container(
              height: 180,
              width: double.infinity,
              color: Colors.white,
              child: const Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 150,
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.diamond),
                              SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Digital Gold'),
                                  Text('24K . 999 Purity'),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 100,
                          height: 60,
                          // color:Colors.amber,

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Selling Price(gm)',style: TextStyle(fontSize: 10),),
                              Text('Rs. 768.00',style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                              Text('10.0000gm'),
                            ],
                          ),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 100,
                          height: 60,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [],
                          ),
                        ),
                        SizedBox(
                          width: 80,
                          height: 60,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('Market Price',style: TextStyle(fontSize: 10),),
                              Text('Rs. 768.00',style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                              Text('10%', style:TextStyle(color: Colors.green)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
        ),
    
        );
        
    
  }
}
