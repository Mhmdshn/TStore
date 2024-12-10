import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_store/features/shop/features/home/domain/entites/category_entity.dart';
import 'package:t_store/features/shop/features/home/domain/use_cases/category_use_case.dart';
import 'package:t_store/features/shop/features/home/presentation/cubits/category/category_state.dart';
import 'package:t_store/service_locator.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(const CategoryInitial());

  final List<CategoryEntity> allCategories = [];
  final List<CategoryEntity> featuredCategories = [];

  void getAllCategories() async {
    emit(const CategoryLoadingState());

    // fetch categories
    var result = await getIt<CategoryUseCase>().call();

    result.fold(
      (error) {
        emit(CategoryFailureState(error));
      },
      (categories) {
        // Replace category list content
        allCategories.clear();
        allCategories.addAll(categories);

        // Filter featured categories and replace their list content
        featuredCategories.clear();
        featuredCategories.addAll(
          categories
              .where(
                (category) =>
                    (category.isFeatured && category.parentId.isEmpty),
              )
              .toList(),
        );
        if (kDebugMode) {
          print(
              '=====================done Fetch Categories======================');
        }

        emit(CategoryLoadedState(allCategories, featuredCategories));
      },
    );
  }
}
