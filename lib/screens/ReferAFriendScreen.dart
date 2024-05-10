import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/CustomTextField.dart';
import '../theme/app_colors.dart';

class ReferAFriend extends StatefulWidget {
  const ReferAFriend({super.key});

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

class _creditProfile extends State<ReferAFriend> {
  // int selectedValue = 1;
  TextEditingController dateCtl = TextEditingController();

  String? _radioSelected = "Male";
  final TextEditingController iconController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBarColor,
      appBar: AppBar(
        backgroundColor: AppColors.appBarColor,
        titleSpacing: 0,
        title: Text(
          "Refer a Friend",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.chevron_left)),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.phone))],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1.5,
                      blurRadius: 1,
                      offset: Offset(0, 1))
                ],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0))),
            child: Padding(
                padding:
                    EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Enter Personal Details",
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomTextFieldWithAsterisk(
                        fieldName: 'Name', keyboardType: TextInputType.name),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Gender",
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                    addRadioButton("Female", "Male"),
                    const SizedBox(
                      height: 20,
                    ),
                    dateOfBirthTextField(context),
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomTextFieldWithAsterisk(
                      fieldName: 'Mobile Number',
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                        fieldName: "Email Id",
                        keyboardType: TextInputType.emailAddress),
                    const SizedBox(
                      height: 20,
                    ),

                    // DropdownMenu(
                    //   width: double.infinity,
                    //     controller: iconController, dropdownMenuEntries: []
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
                    //   ),

                    Padding(
                      padding: const EdgeInsets.only(top: 170),
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          onPressed: () {},
                          child: const Text("Save & Next",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500)),
                        ),
                      ),
                    )
                  ],
                )),
          ),
        ],
      )),
    );
  }

  SizedBox dateOfBirthTextField(BuildContext context) {
    return SizedBox(
        height: 55,
        child: TextFormField(

          controller: dateCtl,
          onTap: () async {
            DateTime? date = DateTime(1900);
            FocusScope.of(context).requestFocus(FocusNode());
            date = await showDatePicker(
                context: context,
                firstDate: DateTime(1900),
                lastDate: DateTime(2100));
            if (date != null) {
              print(date);
              String formattedDate = DateFormat("dd/MM/yyyy").format(date);
              getFormatedDate(_date) {
                var inputFormat = DateFormat('dd/MM/yyyy');
                var inputDate = inputFormat.parse(_date);
                var outputFormat = DateFormat('dd/MM/yyyy');
                return outputFormat.format(inputDate);
              }

              print(getFormatedDate(formattedDate));
              dateCtl.text = getFormatedDate(formattedDate);
            }
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter DOP";
            }
            return null;
          },
          decoration: InputDecoration(
            suffixIcon: Icon(Icons.calendar_today),
            hintText: "DD/MM/YYY",
            label: RichText(
              text: const TextSpan(
                  text: 'DD/MM/YYYY',
                  style: TextStyle(
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
          keyboardType: TextInputType.datetime,
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
