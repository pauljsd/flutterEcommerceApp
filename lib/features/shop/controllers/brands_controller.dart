import 'package:ecommerce/data/repositories/product/product_repository.dart';
import 'package:ecommerce/features/shop/models/brand_model.dart';
import 'package:ecommerce/utils/popups/loader.dart';
import 'package:get/get.dart';

import '../../../data/repositories/brands/brands_repository.dart';
import '../models/product_model.dart';

class BrandsController extends GetxController {
  static BrandsController get instance => Get.find();

  RxBool isLoading = true.obs;
  final RxList<BrandModel> allBrands = <BrandModel>[].obs;
  final RxList<BrandModel> featuredBrands = <BrandModel>[].obs;
  final brandRepository = Get.put(BrandRepository());

  @override
  void onInit() {
    getFeaturedBrands();
    super.onInit();
  }

  ///Load Brands
  Future<void> getFeaturedBrands() async {
    try {
      //Show loader while loading brands
      isLoading.value = true;

      final brands = await brandRepository.getAllBrands();

      allBrands.assignAll(brands);

      featuredBrands.assignAll(
          allBrands.where((brand) => brand.isFeatured ?? false).take(4));
    } catch (e) {
      PLoader.errorSnackBar(title: 'Oh Snap', message: e.toString());
    } finally {
      //Stop Loader
      isLoading.value = false;
    }
  }

  /// Get Brands for Categories
  /// Get Brand Specific Product from your data source

  Future<List<ProductModel>> getBrandProducts(String brandId) async {
    try {
      final products = await ProductRepository.instance
          .getProductsForBrand(brandId: brandId);
      return products;
    } catch (e) {
      PLoader.errorSnackBar(title: 'Oh Snap', message: e.toString());
      return [];
    }
  }
}
