import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:permission_handler/permission_handler.dart';

class SelectContactController extends GetxController {
  late var contacts = <Contact>[].obs;
  final isContactSelected = false.obs;
  late var count = 0.obs;
  late var isSelected = false.obs;


  final ValueNotifier<Set<int>> selectedIndicesNotifier =
      ValueNotifier<Set<int>>({});

  @override
  void onInit() {
    _requestPermissionAndLoadContacts();
  }

  void toggleSelection(int index) {
    final currentSet = Set<int>.from(selectedIndicesNotifier.value);
    if (currentSet.contains(index)) {
      currentSet.remove(index);
    } else {
      currentSet.add(index);
    }
    selectedIndicesNotifier.value = currentSet;
  }

  void selectedContacts() {
    if (isContactSelected.isFalse) {
      isContactSelected.value = true;
      count++;
    }
  }

  Future<void> _requestPermissionAndLoadContacts() async {
    final status = await Permission.contacts.request();

    if (status.isGranted) {
      final contact = await FlutterContacts.getContacts();
      contacts.addAll(contact);
    } else {
      print('Permission to access contacts was denied');
    }
  }
}
