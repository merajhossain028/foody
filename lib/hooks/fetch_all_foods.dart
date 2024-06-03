import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foody/constants/constants.dart';
import 'package:foody/models/api_error.dart';
import 'package:foody/models/foods_model.dart';
import 'package:foody/models/hook_models/hook_result.dart';
import 'package:http/http.dart' as http;

FetchHook useFetchAllFoods(String code) {
  final foods = useState<List<FoodsModel>?>(null);
  final isLoading = useState<bool>(true);
  final error = useState<Exception?>(null);
  final apiError = useState<ApiError?>(null);

  Future<void> fetchData() async {
    isLoading.value = true;
    try {
      Uri url = Uri.parse('$appBaseUrl/api/foods/recommendation/$code');
      final response = await http.get(url);

      debugPrint('Response: ${response.statusCode}');

      if (response.statusCode == 200) {
        foods.value = foodsModelFromJson(response.body);
        debugPrint('All Foods: ${response.body}');
      } else {
        apiError.value = apiErrorFromJson(response.body);
      }
    } catch (e) {
      debugPrint(e.toString());
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

  return FetchHook(
    data: foods.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: refetch,
  );
}
