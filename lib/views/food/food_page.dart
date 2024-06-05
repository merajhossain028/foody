import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:foody/common/custom_button.dart';
import 'package:foody/constants/constants.dart';
import 'package:foody/controllers/food_controller.dart';
import 'package:foody/models/foods_model.dart';
import 'package:foody/views/restaurant/restaurant_page.dart';
import 'package:get/get.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({
    super.key,
    required this.food,
  });

  final FoodsModel food;

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FoodController());
    return Scaffold(
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30.r),
            ),
            child: Stack(
              children: [
                SizedBox(
                  height: 230.h,
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) {
                      controller.changePage(index);
                    },
                    itemCount: widget.food.imageUrl.length,
                    itemBuilder: (context, index) {
                      debugPrint(widget.food.imageUrl.toString());
                      return Container(
                        width: width,
                        height: 230.h,
                        color: kLightWhite,
                        child: CachedNetworkImage(
                          imageUrl: widget.food.imageUrl[index],
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                  bottom: 10,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Obx(() {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          widget.food.imageUrl.length,
                          (index) {
                            return Container(
                              margin: EdgeInsets.all(4.h),
                              height: 10.h,
                              width: 10.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: controller.currentPage.value == index
                                    ? kSecondaryColor
                                    : kGrayLight,
                              ),
                            );
                          },
                        ),
                      );
                    }),
                  ),
                ),
                Positioned(
                  top: 40.h,
                  left: 12.w,
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(
                      Ionicons.chevron_back_circle,
                      color: kPrimaryColor,
                      size: 30,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 12.w,
                  child: CustomButton(
                    onTap: () {
                      Get.to(const RestaurantPage());
                    },
                    btnWidth: 90.w,
                    text: "Open Restaurant",
                  ),
                ),
              ],
            ),
          ),

          
        ],
      ),
    );
  }
}
