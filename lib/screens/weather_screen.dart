import 'package:flutter/material.dart';
import 'package:flutter_projects/controllers/home_controller.dart';
import 'package:flutter_projects/widgets/icon_and_text.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
class WeatherScreen extends GetView<HomeController> {
  const WeatherScreen({super.key});
  static const String routeName = "weatherScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
       appBar: AppBar(backgroundColor: Colors.white,title: Text("Weather Report"),centerTitle: true,actions: [
         IconButton(onPressed: ()=>controller.loadData(controller.city), icon: const Icon(Icons.refresh_rounded,))
       ],),
       body: Obx(()=>!controller.loading.value?SafeArea(
         child: SingleChildScrollView(
           physics: const AlwaysScrollableScrollPhysics(),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.center,
             mainAxisAlignment: MainAxisAlignment.start,
             children: [
               Image.network("http://openweathermap.org/img/wn/${controller.weather!.weatherIcon!}@4x.png"),
           
               Text("${controller.weather!.temperature!.celsius!.toStringAsFixed(0)}°C",style: TextStyle(fontSize: 30.sp,fontWeight: FontWeight.w700),),
               Text(controller.weather!.weatherDescription!,style: TextStyle(fontSize: 26.sp),),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text(DateFormat('EEEE').format(controller.weather!.date!),style: TextStyle(fontSize: 16.sp,color: Colors.grey),),
                   const SizedBox(width: 10,),
                   Text(DateFormat('h:mm a').format(controller.weather!.date!),style: TextStyle(fontSize: 16.sp,color: Colors.grey),),
           
                 ],
               ),
           
               Text(DateFormat('dd-MM-yyyy').format(controller.weather!.date!)),
               const SizedBox(height: 10,),
               IconAndText(title: controller.city, iconColor: Colors.red,icon: Icons.pin_drop_outlined,),
           
           
               Container(
                 height: 30.h,
                 width: 100.w,
                 margin:const  EdgeInsets.all(20),
                 decoration: BoxDecoration(
                  color: Colors.blueAccent.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10)
                 ),
                 child: Padding(
                   padding: const EdgeInsets.all(30),
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           IconAndText(title: DateFormat('h:mm a').format(controller.weather!.sunrise!), iconColor: Colors.orange,header: "Sunrise",icon: Icons.sunny,),
                           IconAndText(title: DateFormat('h:mm a').format(controller.weather!.sunset!), iconColor: Colors.yellow,header: "Sunset",icon: Icons.dark_mode_rounded,),
                         ],
                       ),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           IconAndText(title: "${controller.weather!.tempMax!.celsius!.toStringAsFixed(0)}°C", iconColor: Colors.red,header: "Temp Max",icon: Icons.thermostat,),
                           IconAndText(title: "${controller.weather!.tempMin!.celsius!.toStringAsFixed(0)}°C", iconColor: Colors.blueAccent,header: "Temp Min",icon: Icons.thermostat,),
                         ],
                       ),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           IconAndText(title: "${controller.weather!.windSpeed!.toStringAsFixed(0)}m/s", iconColor: Colors.grey,header: "Wind Speed",icon: Icons.wind_power,),
                           IconAndText(title: "${controller.weather!.humidity!.toStringAsFixed(0)}%", iconColor: Colors.blueGrey,header: "Humidity",icon: Icons.water_drop_rounded,),
                         ],
                       ),
                     ],
                   ),
                 ),
               ),
           
             ],
           ),
         ),
       ):const Center(child: CircularProgressIndicator(),))
    );
  }
}
