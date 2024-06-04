import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:foody/constants/constants.dart';

class Heading extends StatelessWidget {
  const Heading({
    super.key,
    required this.text,
    required this.onTap,
    this.more,
  });

  final String text;
  final void Function() onTap;
  final bool? more;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: Text(
              text,
              style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, color: kDark),
            ),
          ),
          more == null
              ? GestureDetector(
                  onTap: onTap,
                  child: Icon(
                    AntDesign.appstore1,
                    color: kSecondaryColor,
                    size: 20.sp,
                  ),
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
