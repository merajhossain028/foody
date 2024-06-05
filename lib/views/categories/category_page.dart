import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/common/background_container.dart';
import 'package:foody/constants/constants.dart';
import 'package:foody/controllers/catagories_controller.dart';
import 'package:foody/hooks/fetch_category_foods.dart';
import 'package:foody/models/foods_model.dart';
import 'package:foody/shimmers/foodlist_shimmer.dart';
import 'package:foody/views/home/widget/food_tile.dart';
import 'package:get/get.dart';

class CategoryPage extends HookWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    final hookResults = useFetchFoodsByCategory('41007428');
    final List<FoodsModel> foods = hookResults.data ?? [];
    final isLoading = hookResults.isLoading;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kOffWhite,
        leading: IconButton(
          onPressed: () {
            controller.updateCategory = '';
            controller.updateTitle = '';
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: kGray,
        ),
        title: Text(
          controller.titleValue,
          style: const TextStyle(
            color: kGray,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: BackGroundContainer(
        color: Colors.white,
        child: SizedBox(
          height: hieght,
          child: isLoading
              ? const FoodsListShimmer()
              : Padding(
                  padding: EdgeInsets.all(12.h),
                  child: foods.isEmpty
                      ? const Center(
                          child: Text(
                            'No food available',
                            style: TextStyle(
                              color: kGray,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      : ListView(
                          children: List.generate(
                            foods.length,
                            (index) {
                              FoodsModel food = foods[index];
                              return FoodTile(
                                food: food,
                              );
                            },
                          ),
                        ),
                ),
        ),
      ),
    );
  }
}
