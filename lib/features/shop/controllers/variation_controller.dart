import 'package:ecommerce/features/shop/controllers/products/images_controller.dart';
import 'package:ecommerce/features/shop/models/product_variation_model.dart';
import 'package:get/get.dart';

import '../models/product_model.dart';

class VariationController extends GetxController {
  static VariationController get instance => Get.find();

  ///Variables
  RxMap selectedAttributes = {}.obs;
  RxString variationStockStatus = ''.obs;
  Rx<ProductVariationModel> selectedVariation =
      ProductVariationModel.empty().obs;

  ///Select Attribute and Variation
  void onAttributeSelected(
      ProductModel product, attributeName, attributeValue) {
    ///when attribute is selected we will first add that attribute to the selectedAttributes
    final selectedAttributes =
        Map<String, dynamic>.from(this.selectedAttributes);
    selectedAttributes[attributeName] = attributeValue;
    this.selectedAttributes[attributeName] = attributeValue;

    final selectedVariation = product.productVariation!.firstWhere(
        (variation) => _isSameAttributeValues(
            variation.attributeValues, selectedAttributes),
        orElse: () => ProductVariationModel.empty());

    //show the selected variation image as the Main Image
    if (selectedVariation.image.isNotEmpty) {
      ImageController.instance.selectedProductImage.value =
          selectedVariation.image;
    }

    //Assign Selected Variation
    this.selectedVariation.value = selectedVariation;

    //Update Selected Product Variation Status
    getProductVariationStockStatus();
  }

  /// -Check if selected attribute matches any variation attributes
  bool _isSameAttributeValues(Map<String, dynamic> variationAttributes,
      Map<String, dynamic> selectedAttributes) {
    //if selectedAttributes contains 3 attributes and current variation contains 2 then return
    if (variationAttributes.length != selectedAttributes.length) return false;

    //if any of the attribute is different then return. eg [Green, Large] x [Green, Small]
    for (final key in variationAttributes.keys) {
      // Attributes[key] = value which could be [Green, Small, Cotton] etc.
      if (variationAttributes[key] != selectedAttributes[key]) return false;
    }

    return true;
  }

  /// --Check Attribute Availability / Stock in Variation
  // Set<String?> getAttributesAvailabilityVariation(
  List<String?> getAttributesAvailabilityVariation(
      List<ProductVariationModel> variations, String attributeName) {
    //Pass the variation to check which attributes are available and stock is not 0
    final availableVariationAttributeValues = variations
        .where((variation) =>
            // Check Empty or out of Stock Value
            variation.attributeValues[attributeName] != null &&
            variation.attributeValues[attributeName]!.isNotEmpty &&
            variation.stock > 0)
        //fetch all non empty attributes and variation
        .map((variation) => variation.attributeValues[attributeName])
        .toList();

    return availableVariationAttributeValues;
  }

  String getVariationPrice() {
    return (selectedVariation.value.salePrice > 0
            ? selectedVariation.value.salePrice
            : selectedVariation.value.price)
        .toString();
  }

  /// --Check Product Variation Stock Status
  void getProductVariationStockStatus() {
    variationStockStatus.value =
        selectedVariation.value.stock > 0 ? 'In Stock' : 'Out of Stock';

    ///Reset Selected Attribute when Switching Products
    void resetSelectedAttributes() {
      selectedAttributes.clear();
      variationStockStatus.value = '';
      selectedVariation.value = ProductVariationModel.empty();
    }
  }
}
