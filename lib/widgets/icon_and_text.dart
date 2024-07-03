import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class IconAndText extends StatelessWidget {
  const IconAndText({super.key, required this.title, required this.iconColor,this.header,required this.icon});
  final Color iconColor;
  final String title;
  final String? header;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon,color:iconColor,),
        const SizedBox(width: 10,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if(header!=null)
              Text(header!,style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w500),),
            Text(title,style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w700),),

          ],
        ),
      ],
    );
  }
}
