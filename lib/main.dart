import 'package:contact_app/controller/controller_get.dart';
import 'package:contact_app/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Contacts App",
      initialBinding: BindingsBuilder(() {
        Get.put(ContactController());
      }),
      home: HomeScreen(),
    );

  }

}