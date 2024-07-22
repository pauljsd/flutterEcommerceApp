import 'package:ecommerce/features/personalization/screens/address/add_new_address.dart';
import 'package:ecommerce/features/personalization/screens/address/widgets/single_address.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../commons/widgets/appbar/appbar.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String imageUrl = "";
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        backgroundColor: PColors.primary,
        child: const Icon(
          Iconsax.add,
          color: PColors.white,
        ),
      ),
      appBar: PAppBar(
        showBackArrow: true,
        title: Text(
          'Addresses',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(PSizes.defaultSpace),
        child: Column(
          children: [
            PSingleAddress(selectedAddress: true),
            PSingleAddress(selectedAddress: false),
            IconButton(
                icon: Icon(Icons.camera_alt),
                onPressed: () async {
                  try {
                    /// Load the asset image as a Uint8List
                    ByteData byteData =
                        await rootBundle.load(PImages.productImage4);
                    Uint8List imageData = byteData.buffer.asUint8List();

                    ///file Id
                    String uniqueFileName = 'shoeImage5';

                    ///Upload Image to Firebase Storage

                    ///Get a reference to storage root
                    Reference referenceRoot = FirebaseStorage.instance.ref();
                    Reference referenceDirImages =
                        referenceRoot.child('Products');

                    ///Create a reference for the image to be stored
                    Reference referenceImageToUpload =
                        referenceDirImages.child(uniqueFileName);

                    ///Store the file
                    await referenceImageToUpload.putData(imageData);
                    print('image has been uploaded successfully');

                    ///get Url
                    imageUrl = await referenceImageToUpload.getDownloadURL();
                    print(imageUrl);
                  } catch (e) {
                    print('Check Again Bro');
                  }
                })
          ],
        ),
      ),
    );
  }
}
