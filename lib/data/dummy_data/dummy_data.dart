import 'package:ecommerce/features/shop/models/brand_model.dart';
import 'package:ecommerce/features/shop/models/category_model.dart';
import 'package:ecommerce/features/shop/models/product_attribute_model.dart';
import 'package:ecommerce/features/shop/models/product_variation_model.dart';

import '../../features/shop/models/banner_model.dart';
import '../../features/shop/models/product_model.dart';
import '../../routes/routes.dart';
import '../../utils/constants/image_strings.dart';

class PDummyData {
  //Banners
  static final List<BannerModel> banners = [
    BannerModel(
        imageUrl: PImages.promoBanner1,
        targetScreen: PRoutes.order,
        active: false),
    BannerModel(
        imageUrl: PImages.promoBanner1,
        targetScreen: PRoutes.cart,
        active: true),
    BannerModel(
        imageUrl: PImages.promoBanner1,
        targetScreen: PRoutes.favourites,
        active: true),
    BannerModel(
        imageUrl: PImages.promoBanner1,
        targetScreen: PRoutes.search,
        active: true),
    BannerModel(
        imageUrl: PImages.promoBanner2,
        targetScreen: PRoutes.settings,
        active: true),
    BannerModel(
        imageUrl: PImages.promoBanner1,
        targetScreen: PRoutes.userAddress,
        active: true),
    BannerModel(
        imageUrl: PImages.promoBanner2,
        targetScreen: PRoutes.checkout,
        active: false),
  ];

  /// ---User
  // static final UserModel user = UserModel(
  //   id: '',
  //   firstname: 'Coding',
  //   lastname: 'With ATL',
  //   username: 'success@me.com',
  //   email: '+2223212333',
  //   phoneNumber: '',
  //   addresses: [
  //     // AddressModel(
  //     //     id: '1',
  //     //     name: 'Coding With ATL',
  //     //     phoneNumber: '+1223212332',
  //     //     street: '30 Ireku',
  //     //     city: 'Lagos',
  //     //     state: 'Lagos',
  //     //     postalCode: '321123',
  //     //     country: '9ja'),
  //     // AddressModel(
  //     //     id: '1',
  //     //     name: 'ATL dey Code',
  //     //     phoneNumber: '+1223212332',
  //     //     street: 'Plot 6 VGC',
  //     //     city: 'Island',
  //     //     state: 'Lagos',
  //     //     postalCode: '321123',
  //     //     country: '9ja'),
  //   ],
  //   profilePicture: PImages.user,
  // );

  /// ---Cart
  // static final CartModel cart = CartModel(cartId: '001', items: [
  //   CartItemModel(
  //     productId: '001',
  //     variationId: '1',
  //     quantity: 1,
  //     title: products[0].title,
  //     image: products[0].thumbnail,
  //     brandName: products[0].brand!.name,
  //     price: products[0].productVariation![0].attributeValues,
  //   ),
  //   CartItemModel(
  //     productId: '002',
  //     variationId: '',
  //     quantity: 1,
  //     title: products[0].title,
  //     image: products[0].thumbnail,
  //     brandName: products[0].brand!.name,
  //     price: products[0].productVariation![0].attributeValues,
  //   ),
  // ]);

  /// ---Order
  // static final List<OrderModel> orders = [
  //   OrderModel(
  //     id: 'CWT0012',
  //     status: OrderStatus.processing,
  //     items: cart.items,
  //     totalAmount: 265,
  //     orderDate: DateTime(2023, 09, 1),
  //     deliveryDate: DateTime(2023, 09, 9),
  //   ),
  //   OrderModel(
  //     id: 'CWT0012',
  //     status: OrderStatus.processing,
  //     items: cart.items,
  //     totalAmount: 265,
  //     orderDate: DateTime(2023, 09, 1),
  //     deliveryDate: DateTime(2023, 09, 9),
  //   ),
  // ];

  /// ---List of all Categories
  static final List<CategoryModel> categories = [
    CategoryModel(
        id: '1', name: 'Sports', image: PImages.sportIcon, isFeatured: true),
    CategoryModel(
        id: '5',
        name: 'Sports',
        image: PImages.furnitureIcon,
        isFeatured: true),
    CategoryModel(
        id: '2',
        name: 'Sports',
        image: PImages.electronicsIcon,
        isFeatured: true),
    CategoryModel(
        id: '3', name: 'Sports', image: PImages.clothIcon, isFeatured: true),
    CategoryModel(
        id: '4', name: 'Sports', image: PImages.animalIcon, isFeatured: true),
    CategoryModel(
        id: '6', name: 'Sports', image: PImages.shoe, isFeatured: true),
    CategoryModel(
        id: '7',
        name: 'Sports',
        image: PImages.cosmeticsIcon,
        isFeatured: true),
    CategoryModel(
        id: '14', name: 'Sports', image: PImages.jewelryIcon, isFeatured: true),

    ///subcategories
    CategoryModel(
        id: '8',
        name: 'Sports Shoe',
        image: PImages.sportIcon,
        isFeatured: false,
        parentId: '1'),
    CategoryModel(
        id: '9',
        name: 'Track suits',
        image: PImages.sportIcon,
        isFeatured: false,
        parentId: '1'),
    CategoryModel(
        id: '10',
        name: 'Sports Equipments',
        image: PImages.sportIcon,
        isFeatured: false,
        parentId: '1'),

    ///furnitures
    CategoryModel(
        id: '11',
        name: 'Bedroom furniture',
        image: PImages.furnitureIcon,
        isFeatured: false,
        parentId: '5'),
    CategoryModel(
        id: '12',
        name: 'Kitchen furniture',
        image: PImages.furnitureIcon,
        isFeatured: false,
        parentId: '1'),
    CategoryModel(
        id: '13',
        name: 'Office furniture',
        image: PImages.furnitureIcon,
        isFeatured: false,
        parentId: '1'),

    ///electronics
    CategoryModel(
        id: '14',
        name: 'Laptop',
        image: PImages.electronicsIcon,
        isFeatured: false,
        parentId: '2'),
    CategoryModel(
        id: '15',
        name: 'Mobile',
        image: PImages.electronicsIcon,
        isFeatured: false,
        parentId: '2'),

    ///cloth
    CategoryModel(
        id: '10',
        name: 'Shirts',
        image: PImages.clothIcon,
        isFeatured: false,
        parentId: '3'),
  ];

  ///List of all products
  static final List<ProductModel> products = [
    ProductModel(
        id: '001',
        title: 'Green Nike Sport shoe',
        stock: 15,
        price: 135,
        isFeatured: true,
        thumbnail: PImages.productImage1,
        description: 'Green Nike Sport Shoe',
        brand: BrandModel(
            id: '1',
            image: PImages.nikeIcon,
            name: 'Nike',
            productCount: 112,
            isFeatured: true),
        images: [
          PImages.productImage1,
          PImages.productImage2,
          PImages.productImage3,
          PImages.productImage4,
        ],
        salePrice: 30,
        categoryId: '1',
        productAttributes: [
          ProductAttributeModel(
              name: 'Color', values: ['Green', 'Black', 'Red']),
          ProductAttributeModel(
              name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
        ],
        productVariation: [
          ProductVariationModel(
              id: '1',
              stock: 34,
              price: 134,
              salePrice: 122.6,
              image: PImages.productImage2,
              description: 'Product Description indeed',
              attributeValues: {'Color': 'Green', 'Size': 'EU 34'}),
          ProductVariationModel(
              id: '2',
              stock: 15,
              price: 132,
              image: PImages.productImage3,
              description: 'Product Description indeed',
              attributeValues: {'Color': 'Black', 'Size': 'EU 30'})
        ],
        productType: 'ProductType.variable'),
    ProductModel(
        id: '002',
        title: 'T-Shirt for all ages',
        stock: 15,
        price: 35,
        isFeatured: true,
        thumbnail: PImages.productImage13,
        description: 'Description for T-shirts',
        brand: BrandModel(
            id: '6',
            image: PImages.clothIcon,
            name: 'Zara',
            productCount: 112,
            isFeatured: true),
        images: [
          PImages.productImage13,
          PImages.productImage14,
          PImages.productImage15,
        ],
        salePrice: 30,
        sku: 'ABR4568',
        categoryId: '16',
        productAttributes: [
          ProductAttributeModel(
              name: 'Color', values: ['Green', 'Black', 'Red']),
          ProductAttributeModel(
              name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
        ],
        productType: 'ProductType.single'),
    ProductModel(
        id: '003',
        title: 'Jackets Dem',
        stock: 15,
        price: 30000,
        isFeatured: false,
        thumbnail: PImages.productImage34,
        description: 'Confirm Leather Jacket',
        brand: BrandModel(
          id: '6',
          image: PImages.clothIcon,
          name: 'Zara',
        ),
        images: [
          PImages.productImage35,
          PImages.productImage36,
          PImages.productImage37,
        ],
        salePrice: 30,
        sku: 'ABR4568',
        categoryId: '16',
        productAttributes: [
          ProductAttributeModel(
              name: 'Color', values: ['Green', 'Black', 'Red']),
          ProductAttributeModel(
              name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
        ],
        productType: 'ProductType.single'),
    ProductModel(
        id: '004',
        title: 'Color Color TShirt',
        stock: 15,
        price: 135,
        isFeatured: false,
        thumbnail: PImages.productImage2,
        description: 'Color Color cloth',
        brand: BrandModel(
          id: '6',
          image: PImages.nikeIcon,
          name: 'Nike',
        ),
        images: [
          PImages.productImage2,
          PImages.productImage29,
          PImages.productImage30,
          PImages.productImage31,
        ],
        salePrice: 30,
        sku: 'ABR4567',
        categoryId: '16',
        productAttributes: [
          ProductAttributeModel(
              name: 'Color', values: ['Red', 'Yellow', 'Green', 'Blue']),
          ProductAttributeModel(
              name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
        ],
        productVariation: [
          ProductVariationModel(
              id: '1',
              stock: 34,
              price: 134,
              salePrice: 122.6,
              image: PImages.productImage2,
              description: 'Product Description indeed',
              attributeValues: {'Color': 'Green', 'Size': 'EU 34'}),
          ProductVariationModel(
              id: '2',
              stock: 15,
              price: 132,
              image: PImages.productImage2,
              description: 'Product Description indeed',
              attributeValues: {'Color': 'Black', 'Size': 'EU 30'})
        ],
        productType: 'ProductType.variable'),

    ///Products After Banner
    ProductModel(
        id: '005',
        title: 'Air Jordan',
        stock: 15,
        price: 135,
        isFeatured: false,
        thumbnail: PImages.productImage34,
        description: 'Air Jordan in the Air',
        brand: BrandModel(
            id: '1',
            image: PImages.nikeIcon,
            name: 'Nike',
            productCount: 112,
            isFeatured: true),
        images: [
          PImages.productImage34,
          PImages.productImage34,
          PImages.productImage34,
          PImages.productImage34,
        ],
        salePrice: 30,
        sku: 'ABR4567',
        categoryId: '8',
        productAttributes: [
          ProductAttributeModel(
              name: 'Color', values: ['Orange', 'Black', 'Pink']),
          ProductAttributeModel(
              name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
        ],
        productVariation: [
          ProductVariationModel(
              id: '1',
              stock: 34,
              price: 134,
              salePrice: 122.6,
              image: PImages.productImage34,
              description: 'Product Description indeed',
              attributeValues: {'Color': 'Green', 'Size': 'EU 34'}),
          ProductVariationModel(
              id: '2',
              stock: 15,
              price: 132,
              image: PImages.productImage3,
              attributeValues: {'Color': 'Black', 'Size': 'EU 30'}),
          ProductVariationModel(
              id: '3',
              stock: 15,
              price: 132,
              image: PImages.productImage3,
              attributeValues: {'Color': 'Brown', 'Size': 'EU 30'}),
        ],
        productType: 'ProductType.variable'),
    ProductModel(
        id: '006',
        title: 'Phone',
        stock: 15,
        price: 750,
        isFeatured: false,
        thumbnail: PImages.productImage22,
        description: 'Good phone with lasting power life',
        brand: BrandModel(
          id: '7',
          image: PImages.clothIcon,
          name: 'Samsung',
        ),
        images: [
          PImages.productImage23,
          PImages.productImage24,
          PImages.productImage25,
        ],
        salePrice: 30,
        sku: 'ABR4568',
        categoryId: '16',
        productAttributes: [
          ProductAttributeModel(
              name: 'Color', values: ['Green', 'Black', 'Red']),
          ProductAttributeModel(
              name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
        ],
        productType: 'ProductType.single'),
  ];
}
