import 'package:flutter/material.dart';

class TotalOverDueCard extends StatelessWidget {

  final Function callback;

  const TotalOverDueCard({super.key, required this.callback});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //first half
              Container(
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(140, 166, 221, 50),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.0),
                      topRight: Radius.circular(12.0)),
                ),
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total overdue",
                      style: TextStyle(color: Colors.white),
                    ),
                    OutlinedButton(
                        onPressed: () {
                          callback();
                        },
                        style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.white),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.0))),
                        child: const Text(
                          "Pay Now",
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                    left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
                width: double.infinity,
                child: const Column(
                  children: [
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Loan number"),
                          Text("684285642",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  fontWeight: FontWeight.w300, fontSize: 13)),
                        ]),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Loan amount"),
                          Text("Rs3,00,000",
                              style: TextStyle(
                                  fontWeight: FontWeight.w300, fontSize: 13)),
                        ]),
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}
