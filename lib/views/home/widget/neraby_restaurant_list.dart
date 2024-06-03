import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/hooks/fetch_restaurants.dart';
import 'package:foody/models/restaurants_model.dart';
import 'package:foody/shimmers/nearby_shimmer.dart';
import 'package:foody/views/home/widget/restaurant_widget.dart';

class NearbyRestaurants extends HookWidget {
  const NearbyRestaurants({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchRestaurants('41007428');
    List<RestaurantsModel>? restaurants = hookResults.data;
    bool isLoading = hookResults.isLoading;

    return isLoading
        ? const NearbyShimmer()
        : Container(
            height: 190.h,
            padding: EdgeInsets.only(top: 10.h, left: 12.w),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(restaurants!.length, (index) {
                RestaurantsModel restaurant = restaurants[index];
                return RestaurantWidget(
                  image: restaurant.imageUrl,
                  logo: restaurant.logoUrl,
                  title: restaurant.title,
                  time: restaurant.time,
                  rating: "7457",
                );
              }),
            ),
          );
  }
}
