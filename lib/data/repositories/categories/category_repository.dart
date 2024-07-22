import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/features/shop/models/category_model.dart';
import 'package:ecommerce/utils/exceptions/firebase_exceptions.dart';
import 'package:ecommerce/utils/exceptions/platform_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../utils/firebase_storage_service/firebase_storage_service.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  ///Variables
  final _db = FirebaseFirestore.instance;

  ///Get all Categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('Categories').get();
      final list = snapshot.docs
          .map((document) => CategoryModel.fromSnapshot(document))
          .toList();
      return list;
    } on FirebaseException catch (e) {
      throw PFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw PPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong';
    }
  }

  ///Get Sub Categories
  ///Upload Categories to the Cloud Database
  Future<void> uploadDummyData(List<CategoryModel> categories) async {
    try {
      //Upload all the categories along with thier image
      final storage = Get.put(PFirebaseStorageService());

      //Load through each categories
      for (var category in categories) {
        //Get imageData link from the data assets
        final file = await storage.getImageDataFromAssets(category.image);

        //upload image and get it url
        final url =
            await storage.uploadImageData('Categories', file, category.name);

        //assign url to category.name attribute
        category.image = url;

        //store category in firestore
        await _db
            .collection("Categories")
            .doc(category.id)
            .set(category.toJson());
      }
    } on FirebaseException catch (e) {
      throw PFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw PPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again o';
    }
  }
}
