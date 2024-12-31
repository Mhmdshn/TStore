import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_store/common/widgets/animated_widget/animated_grid_layout.dart';
import 'package:t_store/common/widgets/animated_widget/animated_offset_grid_item.dart';
import 'package:t_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:t_store/common/widgets/shimmer/shimmer_products_grid_layout.dart';
import 'package:t_store/features/shop/features/wishlist/presentation/pages/cubits/wishlist_cubit.dart';
import 'package:t_store/features/shop/features/wishlist/presentation/pages/cubits/wishlist_state.dart';
import 'package:t_store/navigation_menu.dart';
import 'package:t_store/utils/constants/images_strings.dart';
import 'package:t_store/utils/helpers/navigation.dart';
import 'package:t_store/utils/loaders/animation_loader.dart';

class BuildWishlistItems extends StatelessWidget {
  const BuildWishlistItems({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishlistCubit, WishlistState>(
      builder: (context, state) {
        if (state is WishlistLoading || state is WishlistInitial) {
          return const ShimmerProductsGridLayout(itemCount: 8);
        }

        if (state is WishlistLoaded) {
          if (state.wishlist.isEmpty) {
            return _buildAnimationWidget(context);
          }

          return AnimatedGridLayout(
            itemCount: state.wishlist.length,
            itemBuilder: (context, index) => TProductCardVertical(
              product: state.wishlist[index],
            ),
            animatedEffect: ({
              required child,
              isVisible,
              onAdd,
              onRemove,
            }) {
              return AnimatedOffsetGridItem(
                isVisible: isVisible!,
                onRemove: onRemove!,
                child: child,
              );
            },
          );
        }

        if (state is WishlistError) {
          return Center(child: Text(state.message));
        }

        return const Center(child: Text('Something went wrong!'));
      },
    );
  }

  Widget _buildAnimationWidget(BuildContext context) {
    return TAnimationLoaderWidget(
      text: 'Woops, Wishlist is empty',
      animation: TImages.pencilAnimation,
      showAction: true,
      actionText: 'Let\'s add more',
      onActionPressed: () => context.removeAll(
        const NavigationMenu(),
      ),
    );
  }
}
