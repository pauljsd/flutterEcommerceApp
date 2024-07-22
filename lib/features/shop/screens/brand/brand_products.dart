import 'package:ecommerce/commons/widgets/appbar/appbar.dart';
import 'package:ecommerce/commons/widgets/brand/brand_card.dart';
import 'package:ecommerce/commons/widgets/sortable/sortable_products.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../controllers/brands_controller.dart';
import '../../models/brand_model.dart';
import '../../models/product_model.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.brand});

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final controller = BrandsController.instance;

    return Scaffold(
      appBar: PAppBar(
        title: Text(
          brand.name,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(PSizes.defaultSpace),
          child: Column(
            children: [
              ///Brand Detail
              PBrandCard(
                showBorder: true,
                brand: brand,
              ),
              SizedBox(
                height: PSizes.spaceBtwSections,
              ),

              FutureBuilder<List<ProductModel>>(
                future: controller.getBrandProducts(brand.id),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(
                      child: Text('No products found for this brand.'),
                    );
                  } else {
                    final brandProduct = snapshot.data!;
                    return PSortableProduct(
                      products: brandProduct,
                    );
                  }
                },
              ),

              // FutureBuilder(
              //     future: controller.getBrandProducts(brand.id),
              //     builder: (context, snapshot) {
              //       ///Handle Loader, No record or Error Message: He discuss this part in the previous video, kindly check it out
              //       //final widget = PCloudHelperFunctions.c
              //       //Record Found
              //       final brandProduct = snapshot.data!;
              //       return PSortableProduct(
              //         products: brandProduct,
              //       );
              //     }),
            ],
          ),
        ),
      ),
    );
  }
}
