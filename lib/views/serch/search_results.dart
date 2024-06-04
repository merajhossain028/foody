import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/constants/constants.dart';
import 'package:foody/controllers/search_controller.dart';
import 'package:foody/models/foods_model.dart';
import 'package:foody/views/home/widget/food_tile.dart';
import 'package:get/get.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchFoodController());
    return Container(
      padding: EdgeInsets.fromLTRB(12.w, 10.h, 12.h, 0),
      height: hieght,
      child: ListView.builder(
          itemCount: controller.searchResults!.length,
          itemBuilder: (context, index) {
            FoodsModel food = controller.searchResults![index];
            return FoodTile(food: food);
          }),
    );
  }
}
