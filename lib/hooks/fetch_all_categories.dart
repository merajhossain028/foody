import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foody/constants/constants.dart';
import 'package:foody/models/api_error.dart';
import 'package:foody/models/categories_model.dart';
import 'package:foody/models/hook_models/hook_result.dart';
import 'package:http/http.dart' as http;

FetchHook useFetchAllCategories() {
  final categoriesItems = useState<List<CatagoriesModel>?>(null);
  final isLoading = useState<bool>(true);
  final error = useState<Exception?>(null);
  final apiError = useState<ApiError?>(null);

  Future<void> fetchData() async {
    isLoading.value = true;
    try {
      Uri url = Uri.parse('$appBaseUrl/api/categories');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        categoriesItems.value = catagoriesModelFromJson(response.body);
        debugPrint('All Categories: ${response.body}');
      } else {
        apiError.value = apiErrorFromJson(response.body);
      }
    } catch (e) {
      error.value = e as Exception;
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
    data: categoriesItems.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: refetch,
  );
}
