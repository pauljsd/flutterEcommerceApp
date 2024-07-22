import 'package:ecommerce/utils/popups/loader.dart';
import 'package:get/get.dart';

import '../../../data/repositories/categories/category_repository.dart';
import '../models/category_model.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  ///Load Categories data
  Future<void> fetchCategories() async {
    try {
      //Show loader while Loading Categories
      isLoading.value = true;

      //Fetch categories from data store (Firestore or Api etc)
      final categories = await _categoryRepository.getAllCategories();

      //Update Categories list
      allCategories.assignAll(categories);

      //Filter featured categories
      featuredCategories.assignAll(allCategories
          .where((category) => category.isFeatured && category.parentId.isEmpty)
          .take(8)
          .toList());
    } catch (e) {
      PLoader.errorSnackBar(title: 'Oh Snap', message: e.toString());
    } finally {
      //Remove Loader
      isLoading.value = false;
    }
  }

  ///Load selected categories data
  ///Get Category or Sub-Category Products
}
