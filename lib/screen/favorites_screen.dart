import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/controller_get.dart';
import 'contact_detail_screen.dart';
import 'contact_tile.dart';

class FavoritesScreen extends StatelessWidget {

  final controller = Get.find<ContactController>();

  @override
  Widget build(BuildContext context) {

    return Obx(() {

      if (controller.filteredFavorites.isEmpty) {
        return const Center(
          child: Text("No favorite contacts"),
        );
      }

      return ListView.builder(

        itemCount: controller.filteredFavorites.length,

        itemBuilder: (context, index) {

          final contact = controller.filteredFavorites[index];

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