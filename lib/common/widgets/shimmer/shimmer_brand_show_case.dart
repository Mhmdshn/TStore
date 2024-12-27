import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:t_store/common/widgets/brands/brand_card.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/features/shop/features/all_brands/domain/entities/brand_entity.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/images_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class ShimmerBrandShowCase extends StatelessWidget {
  const ShimmerBrandShowCase({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: TRoundedContainer(
        showBorder: true,
        borderColor: TColors.darkGrey,
        backgroundColor: Colors.transparent,
        //margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
        padding: const EdgeInsets.all(TSizes.md),
        child: Column(
          children: [
            // Brand with Product Conunt
            TBrandCard(brand: BrandEntity.empty(), showBorder: false),
            const SizedBox(height: TSizes.spaceBtwItems),
            //Brand Top 3 Product Images
            Row(
              children: List.generate(
                3,
                (index) => Expanded(
                  child: TRoundedContainer(
                    height: 100,
                    backgroundColor: THelperFunctions.isDarkMode(context)
                        ? TColors.darkerGrey
                        : TColors.light,
                    margin: const EdgeInsets.only(right: TSizes.sm),
                    padding: const EdgeInsets.all(2),
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(TSizes.cardRadiusLg),
                      child: const Image(
                        image: AssetImage(TImages.productImage1),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
