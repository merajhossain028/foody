import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/constants/constants.dart';
import 'package:foody/models/categories_model.dart';
import 'package:foody/views/categories/category_page.dart';
import 'package:get/route_manager.dart';

// ignore: must_be_immutable
class CategoryTile extends StatelessWidget {
  CategoryTile({
    super.key,
    required this.category,
  });

  CatagoriesModel category;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.to(
          () => const CategoryPage(),
          transition: Transition.fadeIn,
          duration: const Duration(
            milliseconds: 900,
          ),
        );
      },
      leading: CircleAvatar(
        radius: 18.r,
        backgroundColor: kGrayLight,
        child: Image.network(
          category.imageUrl,
          fit: BoxFit.contain,
        ),
      ),
      title: Text(
        category.title,
        style: const TextStyle(
          fontSize: 16,
          color: kGray,
          fontWeight: FontWeight.normal,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: kGray,
        size: 15.r,
      ),
    );
  }
}
