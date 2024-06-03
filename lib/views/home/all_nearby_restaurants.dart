import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/common/background_container.dart';
import 'package:foody/constants/constants.dart';
import 'package:foody/hooks/fetch_all_restaurants.dart';
import 'package:foody/models/restaurants_model.dart';
import 'package:foody/shimmers/foodlist_shimmer.dart';
import 'package:foody/views/home/widget/restarurant_tile.dart';

class AllNearbyRestaurants extends HookWidget {
  const AllNearbyRestaurants({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchAllRestaurants('41007428');
    List<RestaurantsModel> restaurants = hookResults.data ?? [];
    final isLoading = hookResults.isLoading;

    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kSecondaryColor,
        title: const Text(
          'Nearby Restaurants',
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
                  scrollDirection: Axis.vertical,
                  children: List.generate(
                    restaurants.length,
                    (index) {
                      RestaurantsModel restaurant = restaurants[index];
                      return RestaurantTile(
                        restaurant: restaurant,
                      );
                    },
                  ),
                ),
              ),
      ),
    );
  }
}
