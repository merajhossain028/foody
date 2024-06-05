import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/constants/constants.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onTap;
  final double? btnWidth;
  final double? btnHeight;
  final Color? color;
  final double? radius;
  final String text;

  const CustomButton({
    super.key,
    this.onTap,
    this.btnWidth,
    this.btnHeight,
    this.color,
    this.radius,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: btnWidth ?? width,
        height: btnHeight ?? 28.h,
        decoration: BoxDecoration(
          color: color ?? kPrimaryColor,
          borderRadius: BorderRadius.circular(radius ?? 9.r),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 12,
              color: kLightWhite,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
