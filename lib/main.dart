import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Controllers/flight_ontime_controller.dart';

import 'Views/flight_ontime_page.dart';

void main() {
  Get.put(FlightOnTimeController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flight On Time Demo',
      theme: ThemeData(
        // This is the theme of your application.
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const FlightOnTimePage(),
    );
  }
}
