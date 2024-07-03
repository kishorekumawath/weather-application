import 'package:flutter/material.dart';
import 'package:flutter_projects/widgets/searchbar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Weather Application"
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/cloud.png',height: 8.h,),
              const SizedBox(height: 20,),
              const CustomSearchBar()
            ],
          ),
      ),
    );
  }
}
