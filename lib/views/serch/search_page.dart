import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/common/custom_container.dart';
import 'package:foody/constants/constants.dart';
import 'package:foody/shimmers/custom_text_field.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        toolbarHeight: 74.h,
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: kOffWhite,
        title: Padding(
          padding: EdgeInsets.only(top: 12.h),
          child: CustomTextWidget(
            controller: _searchController,
            keyboardType: TextInputType.text,
            hintText: 'Search For Foods',
            suffixIcon: GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.search,
                size: 35,
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: CustomContainer(
          containerrContent: Container(),
        ),
      ),
    );
  }
}
