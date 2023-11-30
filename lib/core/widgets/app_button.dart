import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mdbee_ai/core/resources/app_colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({this.onPressed,required this.btnTitle ,super.key});
  final void Function()? onPressed;
  final String btnTitle;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.mainButtonColor,
        ),
        width: 350.w,
        height: 40.h,
        child: Text(btnTitle,style: const TextStyle(color:Colors.white,fontSize: 20),),
      ),
      );
  }
}