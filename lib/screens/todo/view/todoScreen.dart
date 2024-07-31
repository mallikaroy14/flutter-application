import 'package:feburary_flutter/screens/new_request/view/create_new_request.dart';
import 'package:feburary_flutter/screens/todo/controller/todoController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../theme/app_colors.dart';
import '../model/todoResponse.dart';

class TodoScreen extends GetResponsiveView<TodoController> {
  TodoScreen({super.key});

  @override
  Widget? builder() {
    return Scaffold(
      backgroundColor: AppColors.appBarColor,
      appBar: appBarWidget("To Do List"),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(children: [
          SizedBox(
            height: 5,
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: AppColors.grayColor.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 1,
                      offset: const Offset(0, 1))
                ],
                color: AppColors.whiteColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15))),
            child: Padding(
              padding:
                  EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                    () => ListView.builder(
                        itemCount: controller.getUserList.length,
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        controller.getUserList[index].title,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(width: 10),
                                      Text("Discreption"),
                                    ],
                                  ),
                                  Divider()
                                ],
                              ));
                        }),
                  ),
                  TextFormField(
                    controller: controller.titleController,
                    decoration: const InputDecoration(label: Text("Title")),
                  ),
                  TextFormField(
                    controller: controller.descriptionController,
                    decoration:
                        const InputDecoration(label: Text("Description")),
                  ),
                  ElevatedButton(

                      onPressed: () {
                        controller.addToDoList(DataItem(title:  controller.titleController.text,
                           description:  controller.descriptionController.text));
                      },
                      child: Text("Add"))
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
