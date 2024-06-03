import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/common/background_container.dart';
import 'package:foody/constants/constants.dart';
import 'package:foody/hooks/fetch_all_foods.dart';
import 'package:foody/models/foods_model.dart';
import 'package:foody/shimmers/foodlist_shimmer.dart';
import 'package:foody/views/home/widget/food_tile.dart';

class AllFastestFoods extends HookWidget {
  const AllFastestFoods({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchAllFoods('41007428');
    final List<FoodsModel>? foods = hookResults.data;
    final isLoading = hookResults.isLoading;

    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kSecondaryColor,
        title: const Text(
          'All Fastest Foods',
          style: TextStyle(
            color: kLightWhite,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: BackGroundContainer(
        color: Colors.white,
        child: isLoading
            ? const FoodsListShimmer()
            : Padding(
                padding: EdgeInsets.all(12.h),
                child: ListView(
                  children: List.generate(
                    foods!.length,
                    (index) {
                      FoodsModel food = foods[index];
                      return FoodTile(food: food);
                    },
                  ),
                ),
              ),
      ),
    );
  }
}
