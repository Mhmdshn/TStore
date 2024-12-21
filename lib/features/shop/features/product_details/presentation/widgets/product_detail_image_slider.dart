import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/curved_edges/curved_edges_widgets.dart';
import 'package:t_store/common/widgets/icons/circular_icon.dart';
import 'package:t_store/features/shop/features/all_products/domain/entity/product_entity.dart';
import 'package:t_store/features/shop/features/product_details/presentation/cubits/images_product_cubit.dart';
import 'package:t_store/features/shop/features/product_details/presentation/widgets/build_images_slider.dart';
import 'package:t_store/features/shop/features/product_details/presentation/widgets/show_enlarrged_image.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/images_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TProductDetailImageSlider extends StatelessWidget {
  final ProductEntity product;
  const TProductDetailImageSlider({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return TCurvedEdgeWidget(
      child: Container(
        color: isDark ? TColors.darkerGrey : TColors.light,
        child: Stack(
          children: [
            _buildMainImage(context),
            Positioned(
              bottom: 30,
              right: 0,
              left: TSizes.defaultSpace,
              child: BuildImagesSlider(product: product),
            ),
            _appBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildMainImage(BuildContext context) {
    return BlocBuilder<ImagesProductCubit, String>(
      builder: (context, selectedImage) {
        return SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.45,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(TSizes.productImageRadius * 2),
              child: GestureDetector(
                onTap: () => showEnlargedImage(selectedImage, context),
                child: Image.asset(
                  selectedImage.isEmpty
                      ? product.thumbnail.isNotEmpty
                          ? product.thumbnail
                          : TImages.animalIcon
                      : selectedImage,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.error_rounded),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  TAppBar _appBar() {
    return const TAppBar(
      showBackArrow: true,
      actions: [
        TCircularIcon(icon: Iconsax.heart5, color: Colors.red),
      ],
    );
  }
}
