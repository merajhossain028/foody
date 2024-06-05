import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/hooks/fetch_foods.dart';
import 'package:foody/models/foods_model.dart';
import 'package:foody/shimmers/nearby_shimmer.dart';
import 'package:foody/views/food/food_page.dart';
import 'package:foody/views/home/widget/food_widget.dart';
import 'package:get/get.dart';

class FoodList extends HookWidget {
  const FoodList({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchFoods('41007428');
    List<FoodsModel>? foods = hookResults.data;
    final isLoading = hookResults.isLoading;

    return isLoading
        ? const NearbyShimmer()
        : Container(
            height: 210.h,
            padding: EdgeInsets.only(top: 10.h, left: 12.w),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(foods!.length, (index) {
                FoodsModel food = foods[index];
                return FoodWidget(
                  onTap: () {
                    Get.to(() => FoodPage(food: food));
                  },
                  image: food.imageUrl[0],
                  title: food.title,
                  time: food.time,
                  price: food.price.toStringAsFixed(2),
                );
              }),
            ),
          );
  }
}
