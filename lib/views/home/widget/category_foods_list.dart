import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/constants/constants.dart';
import 'package:foody/hooks/fetch_category_foods.dart';
import 'package:foody/models/foods_model.dart';
import 'package:foody/shimmers/foodlist_shimmer.dart';
import 'package:foody/views/home/widget/food_tile.dart';

class CategoryFoodsList extends HookWidget {
  const CategoryFoodsList({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchFoodsByCategory('41007428');
    final List<FoodsModel> foods = hookResults.data ?? [];
    final isLoading = hookResults.isLoading;

    return SizedBox(
      width: width,
      height: hieght,
      child: isLoading
          ? const FoodsListShimmer()
          : Padding(
              padding: EdgeInsets.all(12.h),
              child: ListView(
                children: List.generate(
                  foods.length,
                  (index) {
                    FoodsModel food = foods[index];
                    return FoodTile(
                      color: Colors.white,
                      food: food,
                    );
                  },
                ),
              ),
            ),
    );
  }
}
