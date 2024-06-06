import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foody/constants/constants.dart';
import 'package:foody/models/api_error.dart';
import 'package:foody/models/hook_models/restaurant_hook.dart';
import 'package:foody/models/restaurants_model.dart';
import 'package:http/http.dart' as http;

FetchRestaurant useFetchSingleRestaurant(String code) {
  final restaurants = useState<RestaurantsModel?>(null);
  final isLoading = useState<bool>(true);
  final error = useState<Exception?>(null);
  final apiError = useState<ApiError?>(null);

  Future<void> fetchData() async {
    isLoading.value = true;
    try {
      Uri url = Uri.parse('$appBaseUrl/api/restaurant/byId/$code');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        var restaurant = jsonDecode(response.body);
        restaurants.value = RestaurantsModel.fromJson(restaurant);
        debugPrint('Restaurant: ${restaurants.value!.toJson()}');
      } else {
        apiError.value = apiErrorFromJson(response.body);
      }
    } catch (e) {
      debugPrint('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  useEffect(() {
    fetchData();
    return null;
  }, []);

  void refetch() {
    isLoading.value = true;
    fetchData();
  }

  return FetchRestaurant(
    data: restaurants.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: refetch,
  );
}
