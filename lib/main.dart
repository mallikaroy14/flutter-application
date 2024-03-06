import 'package:flutter/material.dart';
import 'package:feburary_flutter/models/data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromRGBO(42, 69, 130, 50)),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List _photos = [
    Data("hello", "images/logo.png"),
    Data("Hello", "images/logo.png"),
    Data("Part ", "images/logo.png"),
    Data("Part", "images/logo.png"),
    Data("disbursement", "images/logo.png"),
    Data("Part ", "images/logo.png"),
    Data("Part ", "images/logo.png")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Color.fromRGBO(42, 69, 130, 50)),
        backgroundColor: Color.fromRGBO(42, 69, 130, 50),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                        top: 10.0, left: 10.0, bottom: 10.0, right: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text("Hi Payal",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontSize: 20)),
                        Text("Last login at 23-01-2024, 12.00.00",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 12))
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        top: 15.0, left: 10.0, bottom: 10.0, right: 10.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          InkWell(
                            child:
                                Icon(Icons.notifications, color: Colors.white),
                            onTap: () {
                              //action code when clicked
                              print("The icon is clicked");
                            },
                          ),
                          InkWell(
                            child: Icon(Icons.phone, color: Colors.white),
                            onTap: () {
                              //action code when clicked
                              print("The icon is clicked");
                            },
                          ),
                          InkWell(
                            child: Icon(Icons.face, color: Colors.white),
                            onTap: () {
                              import 'package:flutter/material.dart';
                              import 'package:feburary_flutter/models/data.dart';

                              void main() {
                                runApp(const MyApp());
                              }

                              class MyApp extends StatelessWidget {
                              const MyApp({super.key});

                              // This widget is the root of your application.
                              @override
                              Widget build(BuildContext context) {
                              return MaterialApp(
                              title: 'Flutter Demo',
                              theme: ThemeData(
                              colorScheme:
                              ColorScheme.fromSeed(seedColor: Color.fromRGBO(42, 69, 130, 50)),
                              useMaterial3: true,
                              ),
                              home: const MyHomePage(),
                              );
                              }
                              }

                              class MyHomePage extends StatefulWidget {
                              const MyHomePage({super.key});

                              @override
                              State<MyHomePage> createState() => _MyHomePageState();
                              }

                              class _MyHomePageState extends State<MyHomePage> {
                              List _photos = [
                              Data("hello", "images/logo.png"),
                              Data("Hello", "images/logo.png"),
                              Data("Part ", "images/logo.png"),
                              Data("Part", "images/logo.png"),
                              Data("disbursement", "images/logo.png"),
                              Data("Part ", "images/logo.png"),
                              Data("Part ", "images/logo.png")
                              ];

                              @override
                              Widget build(BuildContext context) {
                              return Scaffold(
                              appBar: AppBar(backgroundColor: Color.fromRGBO(42, 69, 130, 50)),
                              backgroundColor: Color.fromRGBO(42, 69, 130, 50),
                              body: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                              Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                              Container(
                              padding: EdgeInsets.only(
                              top: 10.0, left: 10.0, bottom: 10.0, right: 10.0),
                              child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                              Text("Hi Payal",
                              style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 20)),
                              Text("Last login at 23-01-2024, 12.00.00",
                              style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 12))
                              ],
                              ),
                              ),
                              Container(
                              padding: EdgeInsets.only(
                              top: 15.0, left: 10.0, bottom: 10.0, right: 10.0),
                              child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                              InkWell(
                              child:
                              Icon(Icons.notifications, color: Colors.white),
                              onTap: () {
                              //action code when clicked
                              print("The icon is clicked");
                              },
                              ),
                              InkWell(
                              child: Icon(Icons.phone, color: Colors.white),
                              onTap: () {
                              //action code when clicked
                              print("The icon is clicked");
                              },
                              ),
                              InkWell(
                              child: Icon(Icons.face, color: Colors.white),
                              onTap: () {
                              //action code when clicked
                              print("The icon is clicked");
                              },
                              ),
                              ]),
                              )
                              ]),
                              TotalOverDueCard(),
                              Expanded(
                              child: Container(
                              padding: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15.0),
                              topRight: Radius.circular(15.0))),
                              child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              DisbursedCustomCard(description: "Disbursment", count: 2),
                              SizedBox(height: 10),
                              DisbursedCustomCard(description: "In-progress", count: 10),
                              SizedBox(height: 10),
                              Text("Title comes here",
                              style: TextStyle(color: Colors.black)),
                              SizedBox(height: 10),
                              gridViewLayout()
                              ],
                              ),
                              ),
                              )
                              ],
                              ));
                              }

                              Expanded gridViewLayout() {
                              return Expanded(
                              child: Container(
                              child: GridView.builder(
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount:2,
                              childAspectRatio: 2.5
                              // spacing between columns
                              ),
                              itemCount: _photos.length,
                              itemBuilder: (context, index) {
                              return Container(
                              height: 10.0,
                              margin: const EdgeInsets.all(5.0),
                              padding: const EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8.0)),
                              child: Row(
                              children: [
                              Image(
                              image: AssetImage(_photos[index].image),
                              width: 30,
                              height: 30,
                              ),
                              Text(
                              _photos[index].text,
                              style: Theme.of(context).textTheme.bodySmall,
                              ),
                              ],
                              ),
                              );
                              }),
                              ));
                              }

                              Padding TotalOverDueCard() {
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
                              decoration: BoxDecoration(
                              color: Color.fromRGBO(140, 166, 221, 50),
                              borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12.0),
                              topRight: Radius.circular(12.0)),
                              ),
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                              Text(
                              "Total overdue",
                              style: TextStyle(color: Colors.white),
                              ),
                              OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Colors.white),
                              shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0))),
                              child: Text(
                              "Pay Now",
                              style: TextStyle(color: Colors.white),
                              ))
                              ],
                              ),
                              ),
                              Container(
                              padding: EdgeInsets.only(
                              left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
                              width: double.infinity,
                              child: Column(
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

                              class DisbursedCustomCard extends StatelessWidget {
                              final String? description;
                              final int? count;

                              DisbursedCustomCard({Key? key, this.description, this.count})
                                  : super(key: key);

                              @override
                              Widget build(BuildContext context) {
                              return Container(
                              padding:
                              EdgeInsets.only(left: 12.0, right: 12.0, top: 15.0, bottom: 15.0),
                              child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                              Icon(Icons.home, color: Colors.blue),
                              Text(
                              '${description}',
                              style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 11.0,
                              color: Colors.black),
                              ),
                              Text(
                              '${count}',
                              style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                              color: Colors.black),
                              ),
                              ],
                              ),
                              decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.all(Radius.circular(5.0))),
                              );
                              }
                              }
                              //action code when clicked
                              print("The icon is clicked");
                            },
                          ),
                        ]),
                  )
                ]),
            TotalOverDueCard(),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DisbursedCustomCard(description: "Disbursment", count: 2),
                    SizedBox(height: 10),
                    DisbursedCustomCard(description: "In-progress", count: 10),
                    SizedBox(height: 10),
                    Text("Title comes here",
                        style: TextStyle(color: Colors.black)),
                    SizedBox(height: 10),
                    gridViewLayout()
                  ],
                ),
              ),
            )
          ],
        ));
  }

  Expanded gridViewLayout() {
    return Expanded(
        child: Container(
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:2,
            childAspectRatio: 2.5
            // spacing between columns
          ),
          itemCount: _photos.length,
          itemBuilder: (context, index) {
            return Container(
              height: 10.0,
              margin: const EdgeInsets.all(5.0),
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0)),
                child: Row(
                  children: [
                    Image(
                      image: AssetImage(_photos[index].image),
                      width: 30,
                      height: 30,
                    ),
                    Text(
                      _photos[index].text,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
              ),
            );
          }),
    ));
  }

  Padding TotalOverDueCard() {
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
                decoration: BoxDecoration(
                  color: Color.fromRGBO(140, 166, 221, 50),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.0),
                      topRight: Radius.circular(12.0)),
                ),
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total overdue",
                      style: TextStyle(color: Colors.white),
                    ),
                    OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Colors.white),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.0))),
                        child: Text(
                          "Pay Now",
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
                width: double.infinity,
                child: Column(
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

class DisbursedCustomCard extends StatelessWidget {
  final String? description;
  final int? count;

  DisbursedCustomCard({Key? key, this.description, this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(left: 12.0, right: 12.0, top: 15.0, bottom: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.home, color: Colors.blue),
          Text(
            '${description}',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 11.0,
                color: Colors.black),
          ),
          Text(
            '${count}',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.0,
                color: Colors.black),
          ),
        ],
      ),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
    );
  }
}
