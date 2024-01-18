import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:practice/Style_Files/app_styles.dart';

class digiGoldOrderPad extends StatefulWidget {
  const digiGoldOrderPad({Key? key}) : super(key: key);

  @override
  State<digiGoldOrderPad> createState() => _digiGoldOrderPadState();
}

class _digiGoldOrderPadState extends State<digiGoldOrderPad> {
  List<bool> _selection = [true, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Order Pad',
          style: AppStyles.headingTextStyleBlack,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
        elevation: 0,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 80),
            scrollDirection: Axis.vertical,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            8.0), // Adjust the value as needed
                      ),
                      margin: const EdgeInsets.only(
                          left: 16, right: 16, top: 8, bottom: 8),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      width: 50.0,
                                      height: 50.0,
                                      child: SvgPicture.asset(
                                          'assets/images/banner_startnow.svg',
                                          semanticsLabel: 'Digital')),
                                  const Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('Digital Gold',
                                                  style: AppStyles
                                                      .smallheadingTextStyle),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text('24K .999 Purity',
                                                  style: AppStyles
                                                      .descriptionTextStyle),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  ToggleButtons(
                                    onPressed: (int index) {
                                      setState(() {
                                        _selection[index] = !_selection[index];
                                        if (index == 0 && _selection[index]) {
                                          _selection[1] = false;
                                        } else if (index == 1 &&
                                            _selection[index]) {
                                          _selection[0] = false;
                                        }
                                      });
                                    },
                                    isSelected: _selection,
                                    selectedColor: Colors.black87,
                                    borderWidth: 0,
                                    borderColor: Colors.transparent,
                                    fillColor: Colors.transparent,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border(
                                          bottom: BorderSide(
                                            //                    <--- top side
                                            color: _selection[0]
                                                ? const Color.fromRGBO(
                                                    63, 126, 211, 1)
                                                : const Color.fromARGB(
                                                    255, 230, 229, 229),
                                            width: _selection[0] ? 3.0 : 2.0,
                                          ),
                                        )),
                                        width: 160,
                                        padding: const EdgeInsets.all(8),
                                        child: Center(
                                            child: Text(
                                          'Rs. to Gm.',
                                          style: TextStyle(
                                              color: _selection[0]
                                                  ? Colors.black
                                                  : Colors.grey),
                                        )),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border(
                                          bottom: BorderSide(
                                            color: _selection[1]
                                                ? const Color.fromRGBO(
                                                    63, 126, 211, 1)
                                                : const Color.fromARGB(
                                                    255, 230, 229, 229),
                                            width: _selection[1] ? 3.0 : 2.0,
                                          ),
                                        )),
                                        width: 160,
                                        padding: const EdgeInsets.all(8),
                                        child: Center(
                                            child: Text(
                                          'Gm. to Rs.',
                                          style: TextStyle(
                                              color: _selection[1]
                                                  ? Colors.black
                                                  : Colors.grey),
                                        )),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  SizedBox(
                                    width: 500,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                            _selection[0]
                                                ? "Buying Amount"
                                                : "Quantity(gms)",
                                            style: AppStyles
                                                .smallheadingTextStyle),
                                        const SizedBox(height: 10),
                                        Container(
                                          decoration: const BoxDecoration(
                                              border: Border(
                                            bottom: BorderSide(
                                              color: Color.fromRGBO(
                                                  63, 126, 211, 1),
                                              width: 2.0,
                                            ),
                                          )),
                                          width: 150,
                                          height: 40,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Center(
                                                child: SizedBox(
                                                  width: 25,
                                                  height: 25,
                                                  child: Center(
                                                    child: TextButton(
                                                      onPressed: () {
                                                        // Action to perform when the button is pressed
                                                        print(
                                                            'Button Pressed!');
                                                      },
                                                      style:
                                                          TextButton.styleFrom(
                                                        backgroundColor: Colors
                                                                .grey[
                                                            300], // Light grey background
                                                        padding: const EdgeInsets
                                                            .all(
                                                            8.0), // Padding around the text
                                                      ),
                                                      child: const Center(
                                                        child: Text(
                                                          "-",
                                                          style: TextStyle(
                                                              fontSize:
                                                                  15), // Adjust text size as needed
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 20),
                                              SizedBox(
                                                width: 60,
                                                height: 60,
                                                child: TextFormField(
                                                   keyboardType:
                                                      TextInputType.number,
                                                  decoration:
                                                      const InputDecoration(
                                                    border: InputBorder.none,
                                                    prefix: Text(
                                                      '₹',
                                                      style: TextStyle(
                                                        fontSize:
                                                            16.0, 
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                 
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 20),
                                              Center(
                                                child: SizedBox(
                                                  width: 25,
                                                  height: 25,
                                                  child: TextButton(
                                                    onPressed: () {
                                                      // Action to perform when the button is pressed
                                                      print('Button Pressed!');
                                                    },
                                                    style: TextButton.styleFrom(
                                                      backgroundColor: Colors
                                                              .grey[
                                                          300], // Light grey background
                                                      padding: const EdgeInsets
                                                          .all(
                                                          8.0), // Padding around the text
                                                    ),
                                                    child: const Center(
                                                      child: Text(
                                                        "+",
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                        ), // Adjust text size as needed
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Center(
                                              child: SizedBox(
                                                width: 65,
                                                height: 35,
                                                child: TextButton(
                                                  onPressed: () {
                                                    // Action to perform when the button is pressed
                                                    print('Button Pressed!');
                                                  },
                                                  style: TextButton.styleFrom(
                                                    backgroundColor: const Color
                                                        .fromARGB(255, 230, 229,
                                                        229), // Light grey background
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              14.0),
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      _selection[0]
                                                          ? "1000"
                                                          : "5G",
                                                      style: const TextStyle(
                                                          fontSize: 15,
                                                          color: Colors.grey),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Center(
                                              child: SizedBox(
                                                width: 65,
                                                height: 35,
                                                child: TextButton(
                                                  onPressed: () {
                                                    print('Button Pressed!');
                                                  },
                                                  style: TextButton.styleFrom(
                                                    backgroundColor:
                                                        const Color.fromARGB(
                                                            255, 230, 229, 229),
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              14.0),
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      _selection[0]
                                                          ? "2000"
                                                          : "10G",
                                                      style: const TextStyle(
                                                          fontSize: 15,
                                                          color: Colors.grey),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Center(
                                              child: SizedBox(
                                                width: 65,
                                                height: 35,
                                                child: TextButton(
                                                  onPressed: () {
                                                    print('Button Pressed!');
                                                  },
                                                  style: TextButton.styleFrom(
                                                    backgroundColor:
                                                        const Color.fromARGB(
                                                            255, 230, 229, 229),
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              14.0),
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      _selection[0]
                                                          ? "3000"
                                                          : "15G",
                                                      style: const TextStyle(
                                                          fontSize: 15,
                                                          color: Colors.grey),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text('Valid for'),
                                  SizedBox(width: 5),
                                  Text('5 mins',
                                      style: AppStyles.smallheadingTextStyle),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 16.0, right: 16, top: 4, bottom: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Quantity'),
                              Text('1 gm',
                                  style: AppStyles.smallheadingTextStyle)
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 16.0, right: 16, top: 4, bottom: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Purchase Price'),
                              Text('₹6,500.00',
                                  style: AppStyles.smallheadingTextStyle)
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 16.0, right: 16, top: 4, bottom: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('3% GST'),
                              Text('₹195.00',
                                  style: AppStyles.smallheadingTextStyle)
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: 800,
                height: 50,
                color: Colors.white,
                child: ElevatedButton(
                  onPressed: () {
                    print('Button Pressed');
                    _showAlert(context);
                  },
                  style: AppStyles.commonButtonStyle.copyWith(
                    minimumSize: MaterialStateProperty.all(const Size(200, 50)),
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromRGBO(41, 173, 0, 1.0)),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  child: const Text('Buy'),
                ),
              ),
            ),
          )
        ],
      ),
    );
    ;
  }

  void _showAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  12.0), // Set your desired border radius here
            ),
            content: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          Navigator.of(context).pop();
                          GoRouter.of(context).go('/dashboard');
                        },
                      ),
                    ],
                  ),
                  Image.asset(
                    'assets/images/confirm_ordericon.png',
                    width: 100,
                    height: 100,
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 150,
                    child: Center(
                      child: const Text(
                        'Your Order has been successfully placed',
                        textAlign: TextAlign.center,
                        style: AppStyles.smallheadingTextStyle,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Title',
                              style: AppStyles.smallheadingGreyTextStyle,
                            ),
                            Text('Digital Gold',
                                style: AppStyles.smallheadingTextStyle),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Quantity',
                              style: AppStyles.smallheadingGreyTextStyle,
                            ),
                            Text('1 gm',
                                style: AppStyles.smallheadingTextStyle),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Total Amount',
                              style: AppStyles.smallheadingGreyTextStyle,
                            ),
                            Text('₹6,695.00',
                                style: AppStyles.smallheadingTextStyle),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Order ID',
                              style: AppStyles.smallheadingGreyTextStyle,
                            ),
                            Text('20231233142322',
                                style: AppStyles.smallheadingTextStyle),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  const Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Date and Time',
                              style: AppStyles.smallheadingGreyTextStyle,
                            ),
                            Text('Fri Dec 29 2023 11:59:23 GMT+0530',
                                style: AppStyles.smallheadingTextStyle),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
