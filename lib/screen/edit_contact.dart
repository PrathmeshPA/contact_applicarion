import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/controller_get.dart';
import '../models/contect_model.dart';

class EditContactScreen extends StatelessWidget {

  final Contact contact;

  EditContactScreen(this.contact, {super.key});

  final controller = Get.find<ContactController>();

  final name = TextEditingController();
  final phone = TextEditingController();
  final email = TextEditingController();
  final address = TextEditingController();
  final work = TextEditingController();

  final formKey = GlobalKey<FormState>();

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

    name.text = contact.name;
    phone.text = contact.phone;
    email.text = contact.email;
    work.text = contact.work;
    address.text = contact.address;
    return Scaffold(

      appBar: AppBar(
        title: const Text("Edit Contact"),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Form(
          key: formKey,
          child: Column(
            children: [

              /// Avatar
              CircleAvatar(
                radius: 45,
                backgroundColor: getAvatarColor(contact.name),
                child: Text(
                  contact.name.isNotEmpty
                      ? contact.name[0].toUpperCase()
                      : "?",
                  style: const TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              /// Name Field
              TextField(
                controller: name,
                decoration: InputDecoration(
                  labelText: "Name",
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              /// Phone Field
              TextFormField(
                controller: phone,
                keyboardType: TextInputType.phone,
                validator: (value) {

                  if(value == null || value.isEmpty){
                    return "Phone number required";
                  }

                  if(value.length < 10){
                    return "Enter valid phone number";
                  }

                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Phone Number",
                  prefixIcon: const Icon(Icons.phone),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              /// Email Field
              TextFormField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
                validator: (value){
                  if(value != null && value.isNotEmpty){
                    if(!GetUtils.isEmail(value)){
                      return "Enter valid email";
                    }

                  }

                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Email",
                  prefixIcon: const Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: address,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Address",
                  prefixIcon: const Icon(Icons.location_on),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: work,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Working info",
                  prefixIcon: const Icon(Icons.work),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              /// Update Button
              Row(
                children: [

                  /// Cancel Button
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text(
                          "Cancel",
                          style: TextStyle(fontSize: 18, color: Colors.red),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 15),

                  /// Update Button
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(

                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),

                        child: const Text(
                          "Update Contact",
                          style: TextStyle(fontSize: 18),
                        ),

                        onPressed: () {

                          if (name.text.isEmpty || phone.text.isEmpty) {

                            Get.snackbar(
                              "Error",
                              "Name and Phone are required",
                              snackPosition: SnackPosition.BOTTOM,
                            );

                            return;
                          }

                          if(formKey.currentState!.validate()) {

                            contact.name = name.text;
                            contact.phone = phone.text;
                            contact.email = email.text;
                            contact.address = address.text;
                            contact.work = work.text;

                            controller.updateContact(contact);

                            Get.back();
                          }
                        },
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}