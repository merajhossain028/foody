import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/common/background_container.dart';
import 'package:foody/constants/constants.dart';
import 'package:foody/constants/uidata.dart';
import 'package:foody/views/home/widget/restarurant_tile.dart';

class AllNearbyRestaurants extends StatelessWidget {
  const AllNearbyRestaurants({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kSecondaryColor,
        title: const Text(
          'All Nearby Restaurants',
          style: TextStyle(
            color: kLightWhite,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: BackGroundContainer(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(12.h),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: List.generate(
              restaurants.length,
              (index) {
                return RestaurantTile(
                  restaurant: restaurants[index],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
