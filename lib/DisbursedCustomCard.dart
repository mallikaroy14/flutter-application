import 'package:flutter/material.dart';

class DisbursedCustomCard extends StatelessWidget {
  final String? description;
  final int? count;

  const DisbursedCustomCard({Key? key, this.description, this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          left: 12.0, right: 12.0, top: 15.0, bottom: 15.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.home, color: Colors.blue),
          Text(
            '$description',
            style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 11.0,
                color: Colors.black),
          ),
          Text(
            '$count',
            style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.0,
                color: Colors.black),
          ),
        ],
      ),
    );
  }
}
