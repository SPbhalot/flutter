import 'dart:convert';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:practice/Style_Files/app_styles.dart';
import 'package:practice/common_widgets/chart.dart';

class DigiGoldDetail extends StatefulWidget {
  const DigiGoldDetail({Key? key}) : super(key: key);

  @override
  State<DigiGoldDetail> createState() => _DigiGoldDetailState();
}

class ExpansionPanelItem {
  String title;
  String content;
  bool isExpanded;

  ExpansionPanelItem({
    required this.title,
    required this.content,
    this.isExpanded = true,
  });
}

class _DigiGoldDetailState extends State<DigiGoldDetail> {
  late List<ExpansionPanelItem> _data;

  get bottomNavigationBar => null;

  @override
  void initState() {
    super.initState();
    _loadDummyData();
  }

  void _loadDummyData() {
    const jsonString = '''
    [
      {"title": "Charges / tax applicable", "content": "Content for Section 1"},
      {"title": "Minimum holding period & liquidation", "content": "Content for Section 2"},
      {"title": "About Seller", "content": "Content for Section 3"}
   
    ]
    ''';

    final List<dynamic> jsonData = json.decode(jsonString);
    _data = jsonData
        .map((item) => ExpansionPanelItem(
              title: item['title'],
              content: item['content'],
              isExpanded: false, // Set isExpanded to false initially
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Details',
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
            padding: EdgeInsets.only(bottom: 80),
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
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
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
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text('Current Price/gm',
                                          style: AppStyles
                                              .smallheadingGreyTextStyle),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text('₹${500.toStringAsFixed(2)}',
                                          style: AppStyles.smallheadingTextStyle),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 800,
                              height: 200,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: LineChart(
                                  LineChartData(
                                    gridData: FlGridData(
                                      show: false,
                                      drawVerticalLine:
                                          true, // Show vertical grid lines
                                      drawHorizontalLine:
                                          true, // Show horizontal grid lines
                                      verticalInterval:
                                          1, // Adjust the interval of vertical grid lines
                                      horizontalInterval:
                                          1, // Adjust the interval of horizontal grid lines
                                    ),
                                    titlesData: FlTitlesData(
                                      show:true,
                                        rightTitles: SideTitles(
                                          showTitles: false,
                                        ),
                                        topTitles: SideTitles(
                                          showTitles: false,
                                        ),
                                        bottomTitles: SideTitles(
                                          showTitles: true,
                                          reservedSize: 28,
                                          margin:2,
                                          interval:
                                              1000, // Adjust the interval of bottom axis labels
                                          getTitles: (value) {
                                            if (value >= 2000 && value <= 8000) {
                                              return value.toInt().toString();
                                            }
                                            return '';
                                          },
                                
                                          
                                        ),
                                        //  leftTitles: SideTitles(
                                        //   showTitles: true,
                                        //   reservedSize: 28,
                                        //   margin: 12,
                                        //   interval:
                                        //       1000, // Adjust the interval of bottom axis labels
                                        //   getTitles: (value) {
                                        //     if (value >= 2000 && value <= 5000) {
                                        //       return value.toInt().toString();
                                        //     }
                                        //     return '';
                                        //   },
                                        // ),
                                    
                                        ),
                                    borderData: FlBorderData(
                                      show: false,
                                      border: const Border(
                                        bottom: BorderSide(
                                            color: Color(0xff37434d), width: 1),
                                      ),
                                    ),
                                    minX: 0,
                                    maxX: 7,
                                    minY: 0,
                                    maxY: 10,
                                    lineBarsData: [
                                      LineChartBarData(
                                        spots: [
                                          FlSpot(0, 3),
                                          FlSpot(1, 1),
                                          FlSpot(2, 4),
                                          FlSpot(3, 2),
                                          FlSpot(4, 5),
                                          FlSpot(5, 1),
                                          FlSpot(6, 4),
                                        ],
                                        isCurved: true,
                                        colors: [
                                          Color.fromRGBO(41, 173, 0, 1.0)
                                        ], // Change line color
                                        belowBarData: BarAreaData(show: true),
                                        dotData: FlDotData(show: false),
                                        isStrokeCapRound: false,
                                        preventCurveOverShooting: false,
                                      ),
                                    ],
                                    extraLinesData: ExtraLinesData(
                                      horizontalLines: [
                                        HorizontalLine(
                                          y: 3,
                                          color: Colors.green,
                                          strokeWidth: 2,
                                        ),
                                      ],
                                      verticalLines: [
                                        VerticalLine(
                                          x: 3,
                                          color: Colors.blue,
                                          strokeWidth: 2,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Details',
                        style: AppStyles.headingTextStyleBlack,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ExpansionPanelList(
                        elevation: 1,
                        expandedHeaderPadding: EdgeInsets.all(8),
                        expansionCallback: (int index, bool isExpanded) {
                          setState(() =>
                              _data[index].isExpanded = !_data[index].isExpanded);
                        },
                        children:
                            _data.map<ExpansionPanel>((ExpansionPanelItem item) {
                          return ExpansionPanel(
                            headerBuilder:
                                (BuildContext context, bool isExpanded) {
                              return ListTile(
                                title: Text(item.title),
                              );
                            },
                            body: ListTile(
                              title: Text(item.content),
                            ),
                            isExpanded: item.isExpanded,
                          );
                        }).toList(),
                      ),
                    ),
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
                     GoRouter.of(context).go('/dashboard/order_pad');
                  },
                  style: AppStyles.commonButtonStyle.copyWith(
                    minimumSize: MaterialStateProperty.all(Size(200, 50)),
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromRGBO(41, 173, 0, 1.0)),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  child: Text('Buy'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
