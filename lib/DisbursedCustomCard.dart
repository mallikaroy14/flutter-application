import 'package:feburary_flutter/theme/app_colors.dart';
import 'package:flutter/material.dart';

class DisbursedCustomCard extends StatelessWidget {
  final String? description;
  final int? count;
  final Function callback;

  const DisbursedCustomCard({Key? key, this.description, this.count, required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          left: 12.0, right: 12.0, top: 15.0, bottom: 15.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      child: InkWell(
        onTap: (){
          callback('$description');
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.home, color: Colors.blue),
              Text(
                '$description',
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15.0,
                    color: AppColors.blackColor),
              ),
              Text(
                '$count',
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18.0,
                    color: AppColors.primaryColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
