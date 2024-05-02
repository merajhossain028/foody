import 'package:get/get.dart';

class CategoryController extends GetxController{

  final RxString _catergory = ''.obs;

  String get categoryValue => _catergory.value;

  set updateCategory(String value){
    _catergory.value = value;
  }

  final RxString _title = ''.obs;

  String get titleValue => _title.value;

  set updateTitle(String value){
    _title.value = value;
  }
}