import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/common/custom_container.dart';
import 'package:foody/constants/constants.dart';
import 'package:foody/controllers/search_controller.dart';
import 'package:foody/shimmers/custom_text_field.dart';
import 'package:foody/shimmers/foodlist_shimmer.dart';
import 'package:foody/views/serch/loading_widget.dart';
import 'package:foody/views/serch/search_results.dart';
import 'package:get/get.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchFoodController());
    return Obx(() => Scaffold(
          backgroundColor: kPrimaryColor,
          appBar: AppBar(
            toolbarHeight: 74.h,
            elevation: 0,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            title: Padding(
              padding: EdgeInsets.only(top: 12.h),
              child: CustomTextWidget(
                controller: _searchController,
                keyboardType: TextInputType.text,
                hintText: 'Search For Foods',
                suffixIcon: GestureDetector(
                  onTap: () {
                    if (controller.isTriggered == false) {
                      controller.searchFoods(_searchController.text);
                      controller.setTriggered(true);
                    } else {
                      controller.searchResults = null;
                      controller.setTriggered(false);
                      _searchController.clear();
                    }
                  },
                  child: controller.isTriggered == false
                      ? const Icon(
                          Icons.search,
                          size: 35,
                          color: kPrimaryColor,
                        )
                      : const Icon(
                          Icons.close,
                          size: 35,
                          color: Colors.red,
                        ),
                ),
              ),
            ),
          ),
          body: SafeArea(
            child: CustomContainer(
              color: Colors.white,
              containerrContent: controller.isLoading
                  ? const FoodsListShimmer()
                  : controller.searchResults == null ||
                          controller.searchResults!.isEmpty
                      ? const LoadingWidget()
                      : const SearchResults(),
            ),
          ),
        ));
  }
}
