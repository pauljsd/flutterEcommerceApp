import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModel {
  String id;
  String name;
  String image;
  bool? isFeatured;
  int? productCount;

  BrandModel(
      {required this.id,
      required this.image,
      required this.name,
      this.isFeatured,
      this.productCount});

  //Empty Helper Function
  static BrandModel empty() => BrandModel(id: '', image: '', name: '');

  ///Convert Model to JSON Structure so that you can store data in FireBase
  toJson() {
    return {
      'Id': id,
      'Name': name,
      'Image': image,
      'ProductCount': productCount,
      'IsFeatured': isFeatured,
    };
  }

  ///Map Json oriented document snapshot from Firebase to UserModel
  factory BrandModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return BrandModel.empty();
    return BrandModel(
      id: data['Id'] ?? '',
      name: data['Name'] ?? '',
      image: data['Image'] ?? '',
      isFeatured: data['IsFeatured'] ?? false,
      productCount: int.parse((data['ProductCount'] ?? 0).toString()),
    );
  }

  ///Map Json oriented document snapshot from Firebase to UserModel
  factory BrandModel.fromSnapshotJson(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data();

      //Map Json record to the model
      return BrandModel(
        id: document.id,
        name: data?['Name'] ?? '',
        image: data?['Image'] ?? '',
        isFeatured: data?['IsFeatured'] ?? false,
        productCount: data?['ProductCount'] ?? '',
      );
    } else {
      return BrandModel.empty();
    }
  }
}
