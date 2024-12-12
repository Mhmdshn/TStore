import 'package:t_store/features/shop/features/all_brands/domain/entities/brand_entity.dart';
import 'package:t_store/features/shop/features/all_products/domain/entity/product_attribute_entity.dart';
import 'package:t_store/features/shop/features/all_products/domain/entity/product_variation_entity.dart';

/// final >>  immutabl
class ProductEntity {
  final String id;
  final int? stock;
  final num price;
  final String title;
  final String sku;
  final DateTime? date;
  final double salePrice;
  final String thumbnail;
  final bool? isFeatured;
  final BrandEntity? brand;
  final String? description;
  final String? categoryId;
  final List<String> images; // Defaults to an empty list
  final String productType;
  final List<ProductAttributeEntity>
      productAttributes; // Defaults to an empty list
  final List<ProductVariationEntity>
      productVariations; // Defaults to an empty list

  const ProductEntity({
    required this.id,
    this.stock,
    required this.price,
    required this.title,
    required this.sku,
    this.date,
    required this.salePrice,
    required this.thumbnail,
    this.isFeatured,
    this.brand,
    this.description,
    this.categoryId,
    this.images = const [],
    required this.productType,
    this.productAttributes = const [],
    this.productVariations = const [],
  });
}
