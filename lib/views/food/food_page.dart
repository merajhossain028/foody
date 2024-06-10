import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:foody/common/custom_button.dart';
import 'package:foody/constants/constants.dart';
import 'package:foody/controllers/food_controller.dart';
import 'package:foody/hooks/fetch_single_restaurant.dart';
import 'package:foody/models/foods_model.dart';
import 'package:foody/shimmers/custom_text_field.dart';
import 'package:foody/views/auth/phone_verification.dart';
import 'package:foody/views/restaurant/restaurant_page.dart';
import 'package:get/get.dart';

class FoodPage extends StatefulHookWidget {
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
  final TextEditingController _preferences = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchSingleRestaurant(widget.food.restaurant);
    final controller = Get.put(FoodController());
    controller.loadAdditives(widget.food.additives);

    return Scaffold(
      body: ListView(
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
                      Get.to(
                        RestaurantPage(
                          restaurant: hookResult.data,
                        ),
                      );
                    },
                    btnWidth: 90.w,
                    text: "Open Restaurant",
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.food.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: kDark,
                      ),
                    ),
                    Obx(() {
                      return Text(
                        '\$ ${(widget.food.price + controller.additivePrice) * controller.count.value}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: kPrimaryColor,
                        ),
                      );
                    }),
                  ],
                ),
                SizedBox(height: 5.h),
                Text(
                  widget.food.description,
                  textAlign: TextAlign.justify,
                  maxLines: 8,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: kGray,
                  ),
                ),
                SizedBox(height: 5.h),
                SizedBox(
                  height: 20.h,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children:
                        List.generate(widget.food.foodTags.length, (index) {
                      final tag = widget.food.foodTags[index];
                      return Container(
                        margin: EdgeInsets.only(right: 5.w),
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6.w),
                            child: Text(
                              tag,
                              style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                                color: kWhite,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                SizedBox(height: 15.h),
                const Text(
                  'Additives & Toppings',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: kDark,
                  ),
                ),
                SizedBox(height: 10.h),
                Obx(() {
                  return SizedBox(
                    height: 200.h,
                    child: SingleChildScrollView(
                      child: Column(
                        children: List.generate(controller.additivesList.length,
                            (index) {
                          final additive = controller.additivesList[index];
                          return CheckboxListTile(
                            contentPadding: EdgeInsets.zero,
                            visualDensity: VisualDensity.compact,
                            dense: true,
                            activeColor: kSecondaryColor,
                            value: additive.isChecked.value,
                            tristate: false,
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  additive.title,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: kDark,
                                  ),
                                ),
                                Text(
                                  '\$${additive.price}',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: kPrimaryColor,
                                  ),
                                ),
                              ],
                            ),
                            onChanged: (bool? value) {
                              additive.toggleCheck();
                              controller.getTotalPrice();
                            },
                          );
                        }),
                      ),
                    ),
                  );
                }),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Quantity',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: kDark,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          splashRadius: 0.1,
                          onPressed: () {
                            controller.decrement();
                          },
                          icon: const Icon(
                            AntDesign.minuscircle,
                            color: kDark,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 5.h,
                          ),
                          height: 30.h,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: kDark,
                            ),
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          child: Obx(() {
                            return Text(
                              controller.count.toString(),
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: kDark,
                              ),
                            );
                          }),
                        ),
                        IconButton(
                          splashRadius: 0.1,
                          onPressed: () {
                            controller.increment();
                          },
                          icon: const Icon(
                            AntDesign.pluscircle,
                            color: kDark,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                const Text(
                  'Preferences',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: kDark,
                  ),
                ),
                SizedBox(height: 10.h),
                SizedBox(
                  height: 65.h,
                  child: CustomTextWidget(
                    controller: _preferences,
                    hintText: 'Add a note',
                    maxLines: 3,
                  ),
                ),
                SizedBox(height: 15.h),
                Container(
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showVerificationSheet(context);
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          child: const Text(
                            'Place Order',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: kLightWhite,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: CircleAvatar(
                          backgroundColor: kSecondaryColor,
                          radius: 20.r,
                          child: const Icon(
                            Ionicons.cart,
                            color: kLightWhite,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> showVerificationSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      showDragHandle: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          height: 500.h,
          width: width,
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage('assets/images/restaurant_bk.png'),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.r),
              topRight: Radius.circular(12.r),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(8.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10.h),
                const Text(
                  'Verify Your Phone Number',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: kPrimaryColor,
                  ),
                ),
                SizedBox(
                  height: 250.h,
                  child: SingleChildScrollView(
                    child: Column(
                      children:
                          List.generate(verificationReasons.length, (index) {
                        return ListTile(
                          leading: const Icon(
                            Icons.check_circle_outline,
                            color: kPrimaryColor,
                          ),
                          title: Text(
                            verificationReasons[index],
                            textAlign: TextAlign.justify,
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.normal,
                              color: kGrayLight,
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                CustomButton(
                  text: "Verify Phone Number",
                  onTap: () {
                    Get.to(() => const PhoneVerificationPage());
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
