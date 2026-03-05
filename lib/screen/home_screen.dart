import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/controller_get.dart';
import 'contact_screen.dart';
import 'favorites_screen.dart';
import 'add_contact_screen.dart';

class HomeScreen extends StatelessWidget {

  final controller = Get.put(ContactController());
  var index = 0.obs;

  final pages = [
    ContactsScreen(),
    FavoritesScreen(),
  ];

  @override
  Widget build(BuildContext context) {

    return Obx(() => Scaffold(

      appBar: AppBar(
        toolbarHeight: 110,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              "Contacts",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Container(
              height: 45,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),

              child: TextField(
                decoration: const InputDecoration(
                  hintText: "Search contacts",
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                ),
                onChanged: (value) {
                  controller.searchContacts(value);

                },
              ),
            ),
          ],
        ),
      ),

      body: pages[index.value],

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Get.to(AddContactScreen());
        },
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index.value,
        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            label: "Contacts",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favorites",
          ),
        ],

        onTap: (i) {
          index.value = i;
        },
      ),
    ));
  }
}