import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/controller_get.dart';
import 'contact_detail_screen.dart';
import 'contact_tile.dart';

class ContactsScreen extends StatelessWidget {

  final controller = Get.find<ContactController>();

  @override
  Widget build(BuildContext context) {

    return Obx(() {

      if (controller.filteredContacts.isEmpty) {
        return const Center(
          child: Text("No contacts found"),
        );
      }

      return ListView.builder(
        itemCount: controller.filteredContacts.length,
        itemBuilder: (context, index) {

          final contact = controller.filteredContacts[index];

          return ContactTile(
            contact: contact,
            onTap: () {
              Get.to(ContactDetailScreen(contact));
            },
            onFavorite: () {
              controller.toggleFavorite(contact);
            },
          );
        },
      );
    });
  }
}