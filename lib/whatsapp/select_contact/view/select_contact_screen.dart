import 'package:feburary_flutter/theme/app_colors.dart';
import 'package:feburary_flutter/whatsapp/select_contact/controller/select_contact_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectContactScreen extends GetResponsiveView<
    SelectContactController>
{
  SelectContactScreen({super.key});

  @override
  Widget? builder() {
    return Obx(
      () => Scaffold(
          appBar: controller.isContactSelected.isTrue
              ? AppBar(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ValueListenableBuilder<Set<int>>(
                          valueListenable: controller.selectedIndicesNotifier,
                          builder: (context, selectedIndices, _) {
                            return Text("${selectedIndices.length}",
                                style: TextStyle(fontSize: 15));
                          }),
                      Text(
                        "New broadcast",
                        style: TextStyle(fontSize: 15),
                      ),
                      Text("New group", style: TextStyle(fontSize: 15)),
                    ],
                  ),
                )
              : AppBar(
                  backgroundColor: AppColors.whiteColor,
                  elevation: 3,
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Select contact",
                        style: TextStyle(fontSize: 15),
                      ),
                      RichText(
                        text: TextSpan(
                            text: controller.contacts.length.toString(),
                            style: TextStyle(color: AppColors.blackColor),
                            children: [
                              TextSpan(
                                  text: " contacts",
                                  style: TextStyle(color: AppColors.blackColor))
                            ]),
                      ),
                    ],
                  ),
                  actions: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.search, color: AppColors.blackColor)),
                    PopupMenuButton(
                        iconColor: AppColors.blackColor,
                        itemBuilder: (BuildContext context) {
                          return [
                            PopupMenuItem(
                                value: "Invite a friend",
                                onTap: () {},
                                child: const Text("Invite a friend")),
                            PopupMenuItem(
                                value: "Contacts",
                                onTap: () {},
                                child: const Text("Contacts")),
                            PopupMenuItem(
                                value: "Refresh",
                                onTap: () {},
                                child: const Text("Refresh")),
                            PopupMenuItem(
                                value: "Help",
                                onTap: () {},
                                child: const Text("Help")),
                          ];
                        })
                  ],
                ),
          body: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Container(
              color: AppColors.whiteColor,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 10, right: 10),
                          child: CircleAvatar(
                            child: Icon(
                              Icons.group_add,
                              color: AppColors.whiteColor,
                            ),
                            backgroundColor: Colors.green,
                          ),
                        ),
                        Text(
                          "New group",
                          style: TextStyle(fontSize: 17),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 10, right: 10),
                          child: CircleAvatar(
                            child: Icon(
                              Icons.person,
                              color: AppColors.whiteColor,
                            ),
                            backgroundColor: Colors.green,
                          ),
                        ),
                        Text("New contact", style: TextStyle(fontSize: 17))
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 10, right: 10),
                          child: CircleAvatar(
                            child: Icon(
                              Icons.group_sharp,
                              color: AppColors.whiteColor,
                            ),
                            backgroundColor: Colors.green,
                          ),
                        ),
                        Text("New community", style: TextStyle(fontSize: 17))
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Contacts on WhatsApp",
                      style:
                          TextStyle(fontSize: 15, color: AppColors.hintColor),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Obx(
                      () => ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.contacts.length,
                          itemBuilder: (builder, index) {
                            final contact =
                                controller.contacts.elementAt(index);
                            return ListTile(
                              onLongPress: () {
                                // controller.selectedContacts();
                                controller.toggleSelection(index);
                              },
                              dense: true,
                              contentPadding:
                                  EdgeInsets.only(left: 0.0, right: 0.0),
                              leading: CircleAvatar(child: Icon(Icons.person)),
                              title: Text(contact.displayName ?? 'No Name'),
                              subtitle: contact.phones.isNotEmpty ?? false
                                  ? Text(
                                      contact.phones.first.number ?? 'No Phone')
                                  : null,
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
