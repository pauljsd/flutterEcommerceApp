import 'package:ecommerce/data/repositories/banner/banner_repository.dart';
import 'package:get/get.dart';

import '../../../utils/popups/loader.dart';
import '../models/banner_model.dart';

class BannerController extends GetxController {
  ///Variables
  final isLoading = false.obs;
  final carousalCurrentIndex = 0.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  ///Update Page Navigatioon dots
  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }

  //fetch Banners
  Future<void> fetchBanners() async {
    try {
      //Show loader while Loading Categories
      isLoading.value = true;

      //fetch Banners
      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.fetchBanners();

      //Assign Banners
      this.banners.assignAll(banners);
    } catch (e) {
      PLoader.errorSnackBar(title: 'Oh Snap', message: e.toString());
    } finally {
      //Remove Loader
      isLoading.value = false;
    }
  }
}
