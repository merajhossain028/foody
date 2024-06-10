import 'package:flutter/material.dart';
import 'package:foody/models/foods_model.dart';
import 'package:foody/models/hook_models/additives_obs.dart';
import 'package:get/get.dart';

class FoodController extends GetxController {
  RxInt currentPage = 0.obs;
  bool initialCheckValue = false;
  var additivesList = <AdditiveObs>[].obs;
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

  void loadAdditives(List<Additive> additives) {
    additivesList.clear();

    for (var additiveInfo in additives) {
      var additive = AdditiveObs(
        id: additiveInfo.id,
        title: additiveInfo.title,
        price: additiveInfo.price,
        checked: initialCheckValue,
      );
      if (additives.length == additivesList.length) {
      } else {
        additivesList.add(additive);
        debugPrint(additivesList.length.toString());
      }
    }
  }

  RxDouble totalPrice = 0.0.obs;
  double get additivePrice => totalPrice.value;
  set setTotalPrice(double newPrice) => totalPrice.value = newPrice;

  double getTotalPrice() {
    double totalPrice = 0.0;

    for (var additive in additivesList) {
      if (additive.isChecked.value) {
        totalPrice += double.tryParse(additive.price) ?? 0.0;
      }
    }

    setTotalPrice = totalPrice;
    debugPrint(additivePrice.toString());
    return totalPrice;
  }
}
