import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/common/background_container.dart';
import 'package:foody/constants/constants.dart';
import 'package:foody/hooks/fetch_all_categories.dart';
import 'package:foody/models/categories_model.dart';
import 'package:foody/shimmers/foodlist_shimmer.dart';
import 'package:foody/views/categories/widgets/category_tile.dart';

class AllCategories extends HookWidget {
  const AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchAllCategories();
    List<CatagoriesModel>? categories = hookResult.data;
    final isLoading = hookResult.isLoading;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kOffWhite,
        title: const Text('All Categories'),
      ),
      body: BackGroundContainer(
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.only(left: 12.w, top: 10.h),
          height: hieght,
          child: isLoading
              ? const FoodsListShimmer()
              : ListView(
                  scrollDirection: Axis.vertical,
                  children: List.generate(categories!.length, (index) {
                    CatagoriesModel category = categories[index];
                    return CategoryTile(category: category);
                  }),
                ),
        ),
      ),
    );
  }
}
