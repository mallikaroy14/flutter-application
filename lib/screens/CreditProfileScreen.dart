import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/CustomTextField.dart';

class CreditProfile extends StatefulWidget {
  const CreditProfile({super.key});

  @override
  State<StatefulWidget> createState() => _creditProfile();
}

enum ColorLabel {
  blue('Blue', Colors.blue),
  pink('Pink', Colors.pink),
  green('Green', Colors.green),
  yellow('Orange', Colors.orange),
  grey('Grey', Colors.grey);

  const ColorLabel(this.label, this.color);

  final String label;
  final Color color;
}

class _creditProfile extends State<CreditProfile> {
  // int selectedValue = 1;

  String? _radioSelected = "Male";
  final TextEditingController iconController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Color.fromRGBO(254, 251, 241, 100),
        appBar: AppBar(
            backgroundColor: const Color.fromRGBO(254, 251, 241, 100),
            automaticallyImplyLeading: false,
            leading: Navigator.canPop(context)
                ? IconButton(
                    onPressed: () => {Navigator.of(context).pop()},
                    icon: Icon(Icons.arrow_back, color: Colors.black))
                : null),
        body: Expanded(
          child: Center(
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
                      padding:
                          const EdgeInsets.only(top: 20, left: 15, right: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Enter Personal Details",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(
                            height: 20,
                          ),
                          const CustomTextFieldWithAsterisk(
                              fieldName: 'Name',
                              keyboardType: TextInputType.name),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Gender",
                            style: TextStyle(color: Colors.grey),
                          ),
                          addRadioButton("Female", "Male"),
                          // const SizedBox(
                          //   height: 20,
                          // ),
                          // const CustomTextField(fieldName: 'Date Of Birth', keyboardType:  TextInputType.datetime ),
                          // const SizedBox(
                          //   height: 20,
                          // ),
                          // const CustomTextFieldWithAsterisk(fieldName: 'Mobile Number', keyboardType:  TextInputType.phone,),
                          const SizedBox(
                            height: 20,
                          ),
                          // CustomTextField(fieldName: "Email Id"),
                          // const SizedBox(
                          //   height: 20,
                          // ),

                          DropdownMenu(
                            width: double.infinity,
                              controller: iconController, dropdownMenuEntries: []
                          // ColorLabel.values
                          //     .map<DropdownMenuEntry<ColorLabel>>(
                          //         (ColorLabel color) {
                          //       return DropdownMenuEntry<ColorLabel>(
                          //         value: color,
                          //         label: color.label,
                          //         enabled: color.label != 'Grey',
                          //         style: MenuItemButton.styleFrom(
                          //           foregroundColor: color.color,
                          //         ),
                          //       );
                          //     }).toList(),
                              // dropdownMenuEntries: ColorLabel.values
                              //     .map<DropdownMenuEntry<ColorLabel>>()
                                ),

                          Expanded(
                              child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              margin: EdgeInsets.all(5),
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Color.fromRGBO(042, 068, 130, 50),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                onPressed: () {},
                                child: const Text("Save & Next",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500)
                                ),
                              ),
                            ),
                          ))
                        ],
                      )))
            ],
          )),
        ));
  }

  Row addRadioButton(String data, String data2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Radio(
          value: data2,
          groupValue: _radioSelected,
          activeColor: Colors.blue,
          onChanged: (value) {
            setState(() {
              _radioSelected = value;
            });
          },
        ),
        Text(data2),
        SizedBox(
          width: 50,
        ),
        Radio(
          value: data,
          groupValue: _radioSelected,
          activeColor: Colors.blue,
          onChanged: (value) {
            setState(() {
              _radioSelected = value;
            });
          },
        ),
        Text(data),
      ],
    );
  }
}
