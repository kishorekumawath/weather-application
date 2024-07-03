import 'package:flutter/material.dart';
import 'package:flutter_projects/controllers/home_controller.dart';
import 'package:flutter_projects/screens/weather_screen.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:searchfield/searchfield.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> indianCities = [
      'Mumbai',
      'Delhi',
      'Bangalore',
      'Hyderabad',
      'Ahmedabad',
      'Chennai',
      'Kolkata',
      'Surat',
      'Pune',
      'Jaipur',
      'Lucknow',
      'Kanpur',
      'Nagpur',
      'Indore',
      'Thane',
      'Bhopal',
      'Visakhapatnam',
      'Pimpri-Chinchwad',
      'Patna',
      'Vadodara',
      'Ghaziabad',
      'Ludhiana',
      'Agra',
      'Nashik',
      'Faridabad',
      'Meerut',
      'Rajkot',
      'Kalyan-Dombivli',
      'Vasai-Virar',
      'Varanasi',
      'Srinagar',
      'Aurangabad',
      'Dhanbad',
      'Amritsar',
      'Navi Mumbai',
      'Allahabad',
      'Ranchi',
      'Howrah',
      'Coimbatore',
      'Jabalpur',
      'Gwalior',
      'Vijayawada',
      'Jodhpur',
      'Madurai',
      'Raipur',
      'Kota',
      'Guwahati',
      'Chandigarh',
      'Solapur',
      'Hubli-Dharwad',
      'Mysore',
      'Tiruchirappalli',
      'Bareilly',
      'Aligarh',
      'Tiruppur',
      'Gurgaon',
      'Moradabad',
      'Jalandhar',
      'Bhubaneswar',
      'Salem',
      'Warangal',
      'Mira-Bhayandar',
      'Thiruvananthapuram',
      'Bhiwandi',
      'Saharanpur',
      'Guntur',
      'Amravati',
      'Bikaner',
      'Noida',
      'Jamshedpur',
      'Bhilai',
      'Cuttack',
      'Firozabad',
      'Kochi',
      'Nellore',
      'Bhavnagar',
      'Dehradun',
      'Durgapur',
      'Asansol',
      'Rourkela',
      'Nanded',
      'Kolhapur',
      'Ajmer',
      'Akola',
      'Gulbarga',
      'Jamnagar',
      'Ujjain',
      'Loni',
      'Siliguri',
      'Jhansi',
      'Ulhasnagar',
      'Jammu',
      'Sangli-Miraj & Kupwad',
      'Mangalore',
      'Erode',
      'Belgaum',
      'Kurnool',
      'Malegaon',
      'Gaya',
      'Udaipur',
      'Kozhikode',
      'Maheshtala',
      'Davanagere',
      'Bokaro',
      'South Dumdum',
      'Bellary',
      'Patiala',
      'Gopalpur',
      'Agartala',
      'Bhagalpur',
      'Muzaffarnagar',
      'Bhatpara',
      'Panihati',
      'Latur',
      'Dhule',
      'Tirunelveli',
      'Rohtak',
      'Korba',
      'Bhilwara',
      'Brahmapur',
      'Muzaffarpur',
      'Ahmednagar',
      'Mathura',
      'Kollam',
      'Avadi',
      'Kadapa',
      'Kamarhati',
      'Sambalpur',
      'Bilaspur',
      'Shahjahanpur',
      'Satara',
      'Bijapur',
      'Rampur',
      'Shimoga',
      'Chandrapur',
      'Junagadh',
      'Thrissur',
      'Alwar',
      'Bardhaman',
      'Kulti',
      'Kakinada',
      'Nizamabad',
      'Parbhani',
      'Tumkur',
      'Khammam',
      'Uzhavarkarai',
      'Bihar Sharif',
      'Panipat',
      'Darbhanga',
      'Bally',
      'Aizawl',
      'Dewas',
      'Ichalkaranji',
      'Tirupati',
      'Karnal',
      'Bathinda',
      'Jalna',
      'Barasat',
      'Kirari Suleman Nagar',
      'Purnia',
      'Satna',
      'Mau',
      'Sonipat',
      'Farrukhabad',
      'Sagar',
      'Rourkela Industrial Township',
      'Durg',
      'Imphal',
      'Ratlam',
      'Hapur',
      'Arrah',
      'Karimnagar',
      'Anantapur',
      'Etawah',
      'Ambarnath',
      'North Dumdum',
      'Bharatpur',
      'Begusarai',
      'New Delhi',
      'Gandhidham',
      'Baranagar',
      'Tiruvottiyur',
      'Pondicherry',
      'Sikar',
      'Thoothukudi',
      'Rewa',
      'Mirzapur',
      'Raichur',
      'Pali',
      'Khora',
      'Latur',
      'Panvel',
      'Hardwar',
      'Nagercoil',
      'Haldia',
      'Dindigul',
      'Gandhinagar',
      'Kumbakonam',
      'Tiruvannamalai',
      'Anantapuram',
      'Naihati',
      'Cuddalore',
      'Chittoor',
      'Danapur',
      'Bulandshahr',
      'Uluberia',
      'Katni',
      'Sambhal',
      'Singrauli',
      'Nadiad',
      'Secunderabad',
      'Nagercoil',
      'Shimla',
      'Shivamogga',
      'Tiruchirappalli',
      'Thanjavur',
      'Fatehpur',
      'Surendranagar Dudhrej',
      'Nandyal',
      // (additional city names if any)
    ];
    return SearchField(
      hint: 'Enter india city name',
      suggestions: indianCities
          .map(SearchFieldListItem<String>.new)
          .toList(),
      suggestionState: Suggestion.expand,
      autofocus: true,
      itemHeight: 20.h,
      onSuggestionTap:  (SearchFieldListItem<String> item ) {
        HomeController controller = Get.put(HomeController());
        controller.loadData(item.searchKey);
        Get.toNamed(WeatherScreen.routeName,arguments: item.searchKey);
    },
      searchInputDecoration: InputDecoration(
        hintStyle: const TextStyle(fontSize: 18, color: Colors.grey),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 1,
            color: Colors.grey,
            style: BorderStyle.solid,
          ),
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 1,
            color: Colors.white,
            style: BorderStyle.solid,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
      ),

      suggestionStyle:
      const TextStyle(fontSize: 18, color: Colors.black),
      searchStyle:const TextStyle(fontSize: 20, color: Colors.black),
      suggestionItemDecoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        border: const Border(
          bottom: BorderSide(
            color: Colors.white,
            width: 5,
          ),
        ),
      ),
    );
  }
}
