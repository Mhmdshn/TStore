import 'package:dartz/dartz.dart';
import 'package:t_store/common/core/usecases/use_cases.dart';
import 'package:t_store/common/models/get_all_products_param_model.dart';
import 'package:t_store/features/shop/features/all_products/domain/entity/product_entity.dart';
import 'package:t_store/features/shop/features/all_products/domain/repository/product_repository.dart';
import 'package:t_store/service_locator.dart';

class GetAllProductsByBrandUseCse extends UseCases<
    Either<dynamic, List<ProductEntity>>, GetAllProductsParams> {
  @override
  Future<Either<dynamic, List<ProductEntity>>> call(
      {GetAllProductsParams? params}) async {
    return await getIt<ProductRepository>()
        .getAllProductsByBrand(brandId: params!.id, limit: params.limit);
  }
}
