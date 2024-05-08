import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/data.dart';
import '../theme/app_colors.dart';

class CustomModelBottomSheet {
  static Future _modelBottomSheet(context, {required Widget widget}) {
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        builder: (BuildContext context) {
          return SizedBox(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 10, bottom: 20, left: 10, right: 10),
              child: Column(
                children: [
                  Container(
                    height: 5,
                    width: 80,
                    decoration: const BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                  ),
                  widget
                ],
              ),
            ),
          );
        });
  }
}

class OtherDetailsWidget extends StatelessWidget {
  final List otherDetails = [
    Data("Employee Type", "Salaried"),
    Data("Monthly Household Income", "Rs50,000"),
    Data("House Type ", "Rented"),
    Data("Does customer planning to buy/build a house", "After 12 months"),
    Data("Branch", "Not Applicable"),
    Data("Product ", "Home Loan"),
  ];

  OtherDetailsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var item in otherDetails) Text(item.toString()),
        // Text(
        //   "otherDetai",
        //   style: TextStyle(color: Colors.grey, fontSize: 14),
        // ),
        // Text(
        //   "Salaried",
        //   style: TextStyle(color: Colors.black, fontSize: 14),
        // ),
      ],
    ));
  }
}

class CardView extends StatelessWidget {
  final String cardTile;
  final Widget widget;

  const CardView({super.key, required this.cardTile, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Card.outlined(
        color: Colors.white,
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                    color: AppColors.cardHeader,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0))),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 20, bottom: 10, right: 20, top: 10),
                  child: SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cardTile,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        Icon(Icons.edit),
                      ],
                    ),
                  ),
                ),
              ),
              widget,
            ],
          ),
        ),
      ),
    );
  }
}

class CustomElevatedButton extends StatelessWidget {
  final String buttonCta;

  const CustomElevatedButton({
    super.key,
    required this.buttonCta,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromRGBO(042, 068, 130, 50),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        onPressed: () {},
        child: Text(buttonCta,
            style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.w500)),
      ),
    );
  }
}
