import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:practice/Style_Files/app_styles.dart';
import 'package:practice/common_widgets/digigold_silver_card.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Digital Gold and Silver',
          style: AppStyles.headingTextStyleBlack,
        ),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: const BoxDecoration(
                  color: Color(0xEECF2FB), shape: BoxShape.circle),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: SvgPicture.asset(
                  'assets/images/notificationIcon.svg',
                  width: 20,
                  height: 20,
                  alignment: Alignment.center,
                ),
              ),
            ),
          )
        ],
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification is ScrollEndNotification) {
            // Adjust scroll position to align "Digital Commodities" with the top
            if (_scrollController.offset < 1000.0) {
              _scrollController.animateTo(0.0,
                  duration: const Duration(milliseconds: 500),
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
                // Center(
                //   child: Image.asset(
                //     'assets/images/banner_startnow.png',
                //     width: 600.0,
                //     height: 60.0,
                //     fit: BoxFit.cover,
                //   ),
                // ),
                Container(
                  width: double.infinity,
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
                          Text('Complete your details to kickstart investments',
                              style: AppStyles.headingTextStyleWhite.copyWith(
                                  fontSize: 10, fontWeight: FontWeight.normal))
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
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Benefits Of Digital Commodities',
                      style: AppStyles.headingTextStyleBlack,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16.0, right: 16, top: 0),
                    child: Container(
                      height: 250,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Container(
                              width: 250,
                              height: 200,
                              child: SvgPicture.asset(
                                  'assets/images/bannersecure.svg')),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                              width: 250,
                              height: 200,
                              child: SvgPicture.asset(
                                  'assets/images/banner_diversifyportfolio.svg'))
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Center(
                      child: Container(
                
                        width: double.infinity,
                        child: SvgPicture.asset(
                          'assets/images/banner_simpleinvestment.svg',
                          width:400,
                        ),
                      ),
                    ),
                  ),
                ]),
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
                      imagePath: "assets/images/digigold_cardIcon.svg",
                      title: 'Digital Gold',
                      description: '24K . 999 Purity',
                      buyingPrice: 500,
                      sellingPrice: 500,
                    ),
                    DigiGoldSilverCard(
                      imagePath: "assets/images/digigold_cardIcon.svg",
                      title: 'Digital Gold',
                      description: '24K . 999 Purity',
                      buyingPrice: 500,
                      sellingPrice: 500,
                    ),
                    DigiGoldSilverCard(
                      imagePath: "assets/images/digigold_cardIcon.svg",
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
