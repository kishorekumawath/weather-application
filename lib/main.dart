import 'package:flutter/material.dart';
import 'package:flutter_projects/screens/home.dart';
import 'package:flutter_projects/screens/weather_screen.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'controllers/home_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return GetMaterialApp(
          title: 'Weather Application',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primarySwatch: Colors.green
          ),
          routes: {
            '/':(context)=> const HomeScreen(),
            WeatherScreen.routeName:(context)=>const WeatherScreen(),
          },

        );
      },
    );





  }
}

