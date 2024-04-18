import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color.fromRGBO(254, 251, 241, 100)),
      backgroundColor: Color.fromRGBO(254, 253, 240, 20),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
          height: 50,
          margin: const EdgeInsets.all(10),
          child: ElevatedButton(
              onPressed: () => {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigoAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7)),
                  minimumSize: Size(double.infinity, 50)),
              child: Text("Send OTP",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700)))),
      body: Center(
        child: Column(
          children: [
            Text("Welcome Back!",  style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
            Text("Please login to continue",  style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
                fontWeight: FontWeight.w700)),
            Expanded(
                child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            topRight: Radius.circular(15.0))),
                    padding: EdgeInsets.only(top: 20, left: 15, right: 15),
                    child: const Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)),
                              labelText: "Mobile Number",
                              hintStyle : TextStyle(fontSize: 18, color: Colors.black),
                            labelStyle: TextStyle(fontSize: 18, color: Colors.black),


                          ),
                        )
                      ],
                    )))
          ],
        ),
      ),
    );
  }
}
