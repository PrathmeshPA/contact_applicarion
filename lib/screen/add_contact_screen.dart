import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/controller_get.dart';
import '../models/contect_model.dart';

class AddContactScreen extends StatelessWidget {

  final controller = Get.find<ContactController>();

  final name = TextEditingController();
  final phone = TextEditingController();
  final email = TextEditingController();
  final address = TextEditingController();
  final work = TextEditingController();

  final formKey = GlobalKey<FormState>();

  AddContactScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Add Contact"),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Form(
          key: formKey,
          child: Column(
            children: [

              const CircleAvatar(
                radius: 45,
                backgroundColor: Colors.blue,
                child: Icon(Icons.person,size: 50,color: Colors.white),
              ),

              const SizedBox(height: 30),

              /// Name
              TextFormField(
                controller: name,
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return "Name is required";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Name",
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              /// Phone
              TextFormField(
                controller: phone,
                keyboardType: TextInputType.number,
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

              /// Email
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

              /// Address
              TextFormField(
                controller: address,
                decoration: InputDecoration(
                  labelText: "Address",
                  prefixIcon: const Icon(Icons.location_on),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              /// Work
              TextFormField(
                controller: work,
                decoration: InputDecoration(
                  labelText: "Work Info",
                  prefixIcon: const Icon(Icons.work),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),

              const SizedBox(height: 30),

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
                          style: TextStyle(fontSize: 20,color: Colors.red),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 15),

                  /// Save Button
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
                          "Save Contact",
                          style: TextStyle(fontSize: 20),
                        ),

                        onPressed: () {

                          if(formKey.currentState!.validate()){

                            controller.addContact(
                              Contact(
                                name: name.text,
                                phone: phone.text,
                                email: email.text,
                                address: address.text,
                                work: work.text,
                              ),
                            );

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