import 'package:flutter/material.dart';
import 'package:mdbee_ai/core/resources/app_colors.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Container(
          color: AppColors.lightGrey,
          height: 3,
        )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            'OR',
            style: TextStyle(color: AppColors.grey, fontSize: 15),
          ),
        ),
        Expanded(
            child: Container(
          color: AppColors.lightGrey,
          height: 3,
        )),
      ],
    );
  }
}
