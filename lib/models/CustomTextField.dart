import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String fieldName;
  final TextInputType keyboardType;

  const CustomTextField(
      {Key? key, required this.fieldName, required this.keyboardType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 55,
        child: TextFormField(
          validator: (value) {},
          decoration: InputDecoration(
            label: RichText(
              text: TextSpan(
                  text: fieldName,
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                      fontWeight: FontWeight.normal)),
            ),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)),
            hintStyle: const TextStyle(fontSize: 18, color: Colors.black),
            labelStyle: const TextStyle(fontSize: 18, color: Colors.black),
          ),
          keyboardType: keyboardType,
        ));
  }
}

class CustomTextFieldWithAsterisk extends StatelessWidget {
  final String fieldName;
  final TextInputType keyboardType;

  const CustomTextFieldWithAsterisk(
      {Key? key, required this.fieldName, required this.keyboardType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 55,
        child: TextField(
          // validator: (value) {
          //   if (keyboardType == TextInputType.phone && value != null) {
          //     print("keyboardType_phone");
          //     if (isPhone(value)) {
          //       print("phone_error");
          //       return "Please enter valid phone number";
          //     }
          //     return null;
          //   } else if (keyboardType == TextInputType.name && value != null) {
          //     print("keyboardType_name");
          //     if (value.length < 2) {
          //       print("name_error");
          //       return "Please Enter valid name";
          //     }
          //     return null;
          //   }
          // },
          decoration: InputDecoration(
            label: RichText(
              text: TextSpan(
                  text: fieldName,
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                      fontWeight: FontWeight.normal),
                  children: const [
                    TextSpan(
                        text: ' *',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.red,
                        )
                    )
                  ]
              ),
            ),

            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
            errorBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.red)) ,
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
            hintStyle: TextStyle(fontSize: 18, color: Colors.black),
            labelStyle: TextStyle(fontSize: 18, color: Colors.black),
            // errorText: "Please enter valid name"
          ),
          keyboardType: keyboardType,
        ));
  }
}

class CalenderTextField extends StatelessWidget {
  get initialDate => null;

  get firstDate => null;

  get lastDate => null;

  get onDateChanged => null;

  @override
  Widget build(BuildContext context) {
    return CalendarDatePicker(
        initialDate: initialDate,
        firstDate: firstDate,
        lastDate: lastDate,
        onDateChanged: onDateChanged);
  }
}

bool isPhone(String input) =>
    RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$')
        .hasMatch(input);
