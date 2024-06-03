import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/hooks/fetch_catagories.dart';
import 'package:foody/models/categories_model.dart';
import 'package:foody/shimmers/categories_shimmer.dart';
import 'package:foody/views/home/widget/category_widget.dart';

class CatagoryList extends HookWidget {
  const CatagoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchCategories();
    List<CatagoriesModel>? categoriesList = hookResult.data;
    final isLoading = hookResult.isLoading;
    final error = hookResult.error;

    return Container(
      height: 80.h,
      padding: EdgeInsets.only(top: 10.h, left: 12.w),
      child: isLoading
          ? const CatergoriesShimmer()
          : ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(categoriesList!.length, (i) {
                CatagoriesModel catagory = categoriesList[i];
                return CategoryWidget(
                  category: catagory,
                );
              }),
            ),
    );
  }
}
