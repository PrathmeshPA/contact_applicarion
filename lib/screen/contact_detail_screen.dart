import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controller/controller_get.dart';
import '../models/contect_model.dart';
import 'edit_contact.dart';

class ContactDetailScreen extends StatelessWidget {
  Contact contact;

  ContactDetailScreen(this.contact, {super.key});

  final controller = Get.find<ContactController>();

  Future<void> callContact() async {
    final Uri url = Uri.parse("tel:${contact.phone}");
    await launchUrl(url);
  }

  Color getAvatarColor(String name) {
    final colors = [
      Colors.blue,
      Colors.orange,
      Colors.green,
      Colors.purple,
      Colors.red,
      Colors.teal
    ];

    return colors[name.length % colors.length];
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Contact Profile"),
        centerTitle: true,
      ),

      body: Obx((){
    final updatedContact = controller.contacts
        .firstWhere((c) => c.id == contact.id);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),

      child: Column(
        children: [
          CircleAvatar(
            radius: 45,
            backgroundColor: getAvatarColor(updatedContact.name),
            child: Text(
              updatedContact.name[0].toUpperCase(),
              style: const TextStyle(
                fontSize: 35,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 15),
          Text(
            updatedContact.name,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: [

              Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.green.shade100,
                    child: IconButton(
                      icon: const Icon(Icons.call, color: Colors.green),
                      onPressed: callContact,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text("Call")
                ],
              ),

              Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.blue.shade100,
                    child: IconButton(
                      icon: const Icon(Icons.edit, color: Colors.blue),
                      onPressed: () {
                        Get.to(EditContactScreen(updatedContact));
                      },
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text("Edit")
                ],
              ),

              Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.red.shade100,
                    child: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {

                        Get.dialog(

                          Dialog(

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),

                            child: Padding(
                              padding: const EdgeInsets.all(20),

                              child: Column(
                                mainAxisSize: MainAxisSize.min,

                                children: [

                                  const Text(
                                    "Delete Contact",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  const SizedBox(height: 10),
                                  const Text(
                                    "Are you sure you want to delete this contact?",
                                    textAlign: TextAlign.center,
                                  ),

                                  const SizedBox(height: 20),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                    children: [
                                      OutlinedButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: const Text("Cancel",style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),),
                                      ),

                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.red.shade400,
                                        ),

                                        onPressed: () {

                                          controller.deleteContact(updatedContact.id!);

                                          Get.back();
                                          Get.back();
                                        },

                                        child: const Text("Delete",style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text("Delete")
                ],
              ),
            ],
          ),

          const SizedBox(height: 30),
          Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),

            child: Padding(
              padding: const EdgeInsets.all(15),

              child: Column(
                children: [

                  ListTile(
                    leading: const Icon(Icons.phone),
                    title: const Text("Phone"),
                    subtitle: Text(updatedContact.phone),
                  ),

                  const Divider(),

                  ListTile(
                    leading: const Icon(Icons.email),
                    title: const Text("Email"),
                    subtitle: Text(
                      updatedContact.email.isEmpty
                          ? "Not Provided"
                          : updatedContact.email,
                    ),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.location_on),
                    title: Text("Address"),
                    subtitle: Text(updatedContact.address),
                  ),

                  Divider(),
                  ListTile(
                    leading: Icon(Icons.work),
                    title: Text("Work"),
                    subtitle: Text(updatedContact.work),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

    })

    );
  }
}