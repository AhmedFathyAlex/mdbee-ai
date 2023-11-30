import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mdbee_ai/core/resources/app_colors.dart';
import 'package:mdbee_ai/core/utils/app_sized_box.dart';

class SocialMediaButton extends StatelessWidget {
  const SocialMediaButton({required this.image,required this.btnTitle ,this.onPressed,super.key});
  final void Function()? onPressed;
  final String btnTitle;
  final String image;
  @override
  Widget build(BuildContext context){
    return InkWell(
      onTap: onPressed,
      child: Material(
        elevation: 8,
        child: Container(
          padding:const  EdgeInsets.all(8),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          width: 350.w,
          height: 40.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(image),
              15.pw,
              Text(btnTitle,
              style: const TextStyle(color:Colors.black,fontSize: 20,fontWeight: FontWeight.w500),),
            ],
          ),
        ),
      ),
      );
  }
}