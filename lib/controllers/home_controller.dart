import 'package:flutter/material.dart';
import 'package:flutter_projects/controllers/keys.dart';
import 'package:get/get.dart';
import 'package:weather/weather.dart';

class HomeController extends GetxController{

  String city = "loading";
  final loading = true.obs;
  final WeatherFactory _wf = WeatherFactory(WEATHERKEY);
  Weather? weather;
  void loadData(String cityname) async{
    loading.value = true;
    try{
      city = cityname;
      await _wf.currentWeatherByCityName(city).then((w){
        weather = w;
      });
      loading.value = false;
    }catch(e){
      ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
        content: Text("Something went wrong, Try later!"),
      ));
    }

  }
}