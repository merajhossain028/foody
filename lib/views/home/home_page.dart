import 'package:flutter/material.dart';
import 'package:foody/common/custom_appbar.dart';
import 'package:foody/common/custom_container.dart';
import 'package:foody/common/heading.dart';
import 'package:foody/constants/constants.dart';
import 'package:foody/views/home/all_fastest_foods.dart';
import 'package:foody/views/home/all_nearby_restaurants.dart';
import 'package:foody/views/home/recommendations.dart';
import 'package:foody/views/home/widget/catagory_list.dart';
import 'package:foody/views/home/widget/food_list.dart';
import 'package:foody/views/home/widget/neraby_restaurant_list.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(130),
        child: CustomAppbar(),
      ),
      body: SafeArea(
        child: CustomContainer(
          containerrContent: Column(
            children: [
              const CatagoryList(),
              Heading(
                text: 'Nearby Restaurants',
                onTap: () {
                  Get.to(
                    () => const AllNearbyRestaurants(),
                    transition: Transition.cupertino,
                    duration: const Duration(milliseconds: 900),
                  );
                },
              ),
              const NearbyRestaurants(),
              Heading(
                text: 'Try Something New',
                onTap: () {
                  Get.to(
                    () => const Recommendations(),
                    transition: Transition.cupertino,
                    duration: const Duration(milliseconds: 900),
                  );
                },
              ),
              const FoodList(),
              Heading(
                text: 'Fastest food closer to you',
                onTap: () {
                  Get.to(
                    () => const AllFastestFoods(),
                    transition: Transition.cupertino,
                    duration: const Duration(milliseconds: 900),
                  );
                },
              ),
              const FoodList(),
            ],
          ),
        ),
      ),
    );
  }
}
