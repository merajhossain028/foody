import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/constants/constants.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({
    super.key,
    this.keyboardType,
    this.controller,
    this.onEditingComplete,
    this.hintText,
    this.obscureText,
    this.suffixIcon,
    this.prefixIcon,
    this.validator,
  });

  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final void Function()? onEditingComplete;
  final String? hintText;
  final bool? obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6.h),
      padding: EdgeInsets.all(6.h),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 0.4,
        ),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        onEditingComplete: onEditingComplete,
        obscureText: obscureText ?? false,
        cursorHeight: 20.h,
        style: TextStyle(
          fontSize: 15.sp,
          color: Colors.black,
          fontWeight: FontWeight.normal,
        ),
        validator: validator,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          hintStyle: TextStyle(
            fontSize: 15.sp,
            color: kDark,
            fontWeight: FontWeight.normal,
          ),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
        ),
      ),
    );
  }
}
