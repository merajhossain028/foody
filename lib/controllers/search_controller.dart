import 'package:flutter/material.dart';
import 'package:foody/constants/constants.dart';
import 'package:foody/models/api_error.dart';
import 'package:foody/models/foods_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SearchFoodController extends GetxController {
  final RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  void setLoading(bool value) {
    _isLoading.value = value;
  }

  final RxBool _isTriggered = false.obs;

  bool get isTriggered => _isTriggered.value;

  void setTriggered(bool value) {
    _isTriggered.value = value;
  }

  List<FoodsModel>? searchResults;

  void searchFoods(String key) async {
    setLoading(true);

    Uri url = Uri.parse("$appBaseUrl/api/foods/search/$key");

    debugPrint("Key: $key");
    debugPrint("Url: $url");

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        searchResults = foodsModelFromJson(response.body);
        setLoading(false);
        debugPrint("Search Results: $searchResults");
      } else {
        setLoading(false);
        var error = apiErrorFromJson(response.body);
        debugPrint("Error: $error");
      }
    } catch (e) {
      setLoading(false);
      debugPrint("Error: $e");
    }
  }
}
