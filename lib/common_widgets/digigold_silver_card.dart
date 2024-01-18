
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:practice/Style_Files/app_styles.dart';


class DigiGoldSilverCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final double buyingPrice;
  final double sellingPrice;

  DigiGoldSilverCard({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.buyingPrice,
    required this.sellingPrice,
  });
 

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0), // Adjust the value as needed
      ),
      margin: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
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
                      child:
                          SvgPicture.asset(imagePath, semanticsLabel: 'Digital')
                      ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(title,
                                  style: AppStyles.smallheadingTextStyle),
                              SizedBox(
                                height: 5,
                              ),
                              Text(description,
                                  style: AppStyles.descriptionTextStyle),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                          GoRouter.of(context).go('/dashboard/details');
                          },
                          style: AppStyles.commonButtonStyle.copyWith(
                            minimumSize:
                                MaterialStateProperty.all(Size(100, 50)),
                            backgroundColor: MaterialStateProperty.all(
                                Color.fromRGBO(
                                    41, 173, 0, 1.0)), 
                            foregroundColor: MaterialStateProperty.all(
                                Colors.white), 
                          ),
                          child: Text('Buy'),
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
                      const Text('Buying Price/gm',
                          style: AppStyles.smallheadingGreyTextStyle),
                      const SizedBox(
                        height: 5,
                      ),
                      Text('₹${buyingPrice.toStringAsFixed(2)}',
                          style: AppStyles.smallheadingTextStyle),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Selling Price/gm',
                          style: AppStyles.smallheadingGreyTextStyle),
                      const SizedBox(
                        height: 5,
                      ),
                      Text('₹${sellingPrice.toStringAsFixed(2)}',
                          style: AppStyles.smallheadingTextStyle),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
