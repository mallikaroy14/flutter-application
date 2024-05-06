import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../localization/language/languages.dart';

class MyProfileScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyProfileScreen();
}

class _MyProfileScreen extends State<MyProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color.fromRGBO(254, 252, 230, 100)),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0))),
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Column(children: [
                  Card.outlined(
                    color: Colors.white,
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(243, 247, 254, 100),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15.0),
                                    topRight: Radius.circular(15.0))),
                            padding: EdgeInsets.all(8.0),
                            child: SizedBox(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Personal Details", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),),
                                  Icon(Icons.edit),
                                ],
                              ),
                            ),
                          ),
                          Text(Languages.of(context)?.stringWelcomeBack ?? "",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                          Text(Languages.of(context)?.stringPleaseLogin ?? "",
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
