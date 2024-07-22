import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/utils/exceptions/firebase_exceptions.dart';
import 'package:ecommerce/utils/exceptions/platform_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../features/shop/models/product_model.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/firebase_storage_service/firebase_storage_service.dart';

///Repository for managing product-related data and operations.
class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  ///Firestore instance for database interactions
  final _db = FirebaseFirestore.instance;

  ///to get the image url from firestore
  String? downloadURL;

  ///Get limited featured products
  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
          .limit(4)
          .get();
      print(snapshot);
      snapshot.docs.forEach((doc) {
        print(doc.data());
      });
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw PFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw PPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again AGAIN???';
      // throw e;
    }
  }

  ///Get limited featured products
  Future<List<ProductModel>> getAllFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
          .get();
      print(snapshot);
      snapshot.docs.forEach((doc) {
        print(doc.data());
      });
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw PFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw PPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again AGAIN???';
      // throw e;
    }
  }

  //Get Products based on the Query
  Future<List<ProductModel>> fetchProductsByQuery(Query query) async {
    try {
      final querySnapshot = await query.get();
      final List<ProductModel> productList = querySnapshot.docs
          .map((doc) => ProductModel.fromQuerySnapshot(doc))
          .toList();
      return productList;
    } on FirebaseException catch (e) {
      throw PFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw PPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again AGAIN???';
      // throw e;
    }
  }

  //Get Products by brands
  Future<List<ProductModel>> getProductsForBrand(
      {required String brandId, int limit = -1}) async {
    try {
      final querySnapshot = limit == -1
          ? await _db
              .collection('Products')
              .where('Brand.Id', isEqualTo: brandId)
              .get()
          : await _db
              .collection('Products')
              .where('Brand.Id', isEqualTo: brandId)
              .limit(limit)
              .get();

      final products = querySnapshot.docs
          .map((doc) => ProductModel.fromSnapshot(doc))
          .toList();

      return products;
    } on FirebaseException catch (e) {
      throw PFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw PPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again AGAIN???';
      // throw e;
    }
  }

  // Add this method to print the list of featured products
  void printFeaturedProducts() async {
    try {
      List<ProductModel> featuredProducts = await getFeaturedProducts();
      featuredProducts.forEach((product) {
        print(product.toJson());
      });
    } catch (e) {
      print('Error fetching and printing featured products: $e');
    }
  }

  /// Upload dummy data to the cloud firebase
  Future<void> uploadDummyData(List<ProductModel> products) async {
    try {
      ///Upload all the products along with their images
      final storage = Get.put(PFirebaseStorageService());

      ///Loop through each product
      for (var product in products) {
        // Get image data link from local assets
        final thumbnail =
            await storage.getImageDataFromAssets(product.thumbnail);

        //Upload images and get its url
        final url = await storage.uploadImageData(
            'Products/Images', thumbnail, product.thumbnail.toString());

        //Assign Url to product.thumbnail attribute
        product.thumbnail = url;

        //Product list of images
        if (product.images != null && product.images!.isNotEmpty) {
          List<String> imagesUrl = [];
          for (var image in product.images!) {
            //Get image data link from local assets
            final assetImage = await storage.getImageDataFromAssets(image);

            //Upload image and get its URL
            final url = await storage.uploadImageData(
                'Products/Images', assetImage, image);

            //Assign URL to product.thumbnail attribute
            imagesUrl.add(url);
          }
          product.images!.clear();
          product.images!.addAll(imagesUrl);
        }

        //Upload Variation Image
        if (product.productType == ProductType.variable.toString()) {
          for (var variation in product.productVariation!) {
            //Get image data link from local asset
            final assetImage =
                await storage.getImageDataFromAssets(variation.image);

            // Upload Image and get its url
            final url = await storage.uploadImageData(
                'Products/Images', assetImage, variation.image);

            //Assign url to variation.image attribute
            variation.image = url;
          }
        }

        //Store Product in FireStore
        await _db.collection("Products").doc(product.id).set(product.toJson());
      }
    } on FirebaseException catch (e) {
      throw e.message!;
    } on SocketException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.message!;
    } catch (e) {
      throw e.toString();
    }
  }
}
