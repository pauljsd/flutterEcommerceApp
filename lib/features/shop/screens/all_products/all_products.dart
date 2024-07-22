import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/commons/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../commons/widgets/appbar/appbar.dart';
import '../../../../commons/widgets/sortable/sortable_products.dart';
import '../../controllers/all_products_controller.dart';
import '../../models/product_model.dart';

class AllProducts extends StatelessWidget {
  const AllProducts(
      {super.key, required this.title, this.query, this.futureMethod});

  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    //Initialize Controller for managing product fetching
    final controller = Get.put(AllProductsController());
    return Scaffold(
      appBar: PAppBar(
        title: Text('Popular Products'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(PSizes.defaultSpace),
          child: FutureBuilder(
              future: futureMethod ?? controller.fetchProductsByQuery(query),
              builder: (context, snapshot) {
                ///check the state of FutureBuilder snapshot
                const loader = PVerticalProductShimmer();
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return loader;
                }

                if (!snapshot.hasData ||
                    snapshot.data == null ||
                    snapshot.data!.isEmpty) {
                  return const Center(child: Text('No Data Found'));
                }

                if (snapshot.hasError) {
                  return const Center(child: Text('Something went wrong'));
                }

                //Product Found?1
                final products = snapshot.data!;

                return PSortableProduct(
                  products: products,
                );
              }),
        ),
      ),
    );
  }
}
