import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodController extends GetxController {
  RxInt currentPage = 0.obs;
  RxInt count = 1.obs;

  void changePage(int index) {
    currentPage.value = index;
    debugPrint(currentPage.value.toString());
  }

  void increment() {
    count.value++;
  }

  void decrement() {
    if (count.value > 1) {
      count.value--;
    }
  }
}
