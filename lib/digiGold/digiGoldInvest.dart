import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:practice/Style_Files/app_styles.dart';
import 'package:practice/common_widgets/digigold_silver_card.dart';

class digiGoldInvest extends StatefulWidget {
  const digiGoldInvest({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<digiGoldInvest> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Invest',
          style: AppStyles.headingTextStyleBlack,
        ),
        elevation: 0,
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification is ScrollEndNotification) {
            // Adjust scroll position to align "Digital Commodities" with the top
            if (_scrollController.offset < 1000.0) {
              _scrollController.animateTo(0.0,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut);
            }
          }
          return true;
        },
        child: SingleChildScrollView(
          controller: _scrollController,
          scrollDirection: Axis.vertical,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width:double.infinity,
                  height: 60,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(1, 42, 99, 1),
                        Color.fromRGBO(48, 83, 130, 1)
                      ], // Set your gradient colors
                      begin: Alignment.centerLeft, // Adjust the begin point
                      end: Alignment.centerRight, // Adjust the end point
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          width: 30,
                          height: 30,
                          child: SvgPicture.asset(
                              'assets/images/CoinBagIcon.svg')),
                      Container(
                          
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Complete your details',
                                  style: AppStyles.headingTextStyleWhite),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                  'Complete your details to kickstart investments',
                                  style: AppStyles.headingTextStyleWhite
                                      .copyWith(
                                          fontSize: 10,
                                          fontWeight: FontWeight.normal))
                            ],
                          )),
                      Container(
                        width: 100,
                        child: const Text('Start now',
                            style: AppStyles.headingTextStyleWhite),
                      )
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Digital Commodities',
                    style: AppStyles.headingTextStyleBlack,
                  ),
                ),
                Column(
                  children: [
                    DigiGoldSilverCard(
                      imagePath:
                          "assets/images/banner_startnow.svg", 
                      title: 'Digital Gold',
                      description: '24K . 999 Purity',
                      buyingPrice: 500,
                      sellingPrice: 500,
                    ),
                    DigiGoldSilverCard(
                      imagePath:
                          "assets/images/banner_startnow.svg", 
                      title: 'Digital Gold',
                      description: '24K . 999 Purity',
                      buyingPrice: 500,
                      sellingPrice: 500,
                    ),
                    DigiGoldSilverCard(
                      imagePath:
                          "assets/images/banner_startnow.svg", 
                      title: 'Digital Gold',
                      description: '24K . 999 Purity',
                      buyingPrice: 500,
                      sellingPrice: 500,
                    )
                
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
