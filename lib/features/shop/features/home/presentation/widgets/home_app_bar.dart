import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:t_store/common/widgets/shimmer/shimmer_widget.dart';
import 'package:t_store/features/personalization/cubit/user_cubit.dart';
import 'package:t_store/features/personalization/cubit/user_state.dart';
import 'package:t_store/features/shop/features/cart/presentation/pages/cart_page.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/navigation.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TAppBar(
      title: _buildTitle(context),
      actions: [
        TCartCounterIcon(
          onPressed: () => context.pushPage(const CartPage()),
          iconColor: TColors.white,
        ),
      ],
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          TTexts.homeAppbarTitle,
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .apply(color: TColors.grey),
        ),
        _buildUserName(context),
      ],
    );
  }

  Widget _buildUserName(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state is FetchUserDataLoadedState) {
          return Text(
            "${state.userData.firstName} ${state.userData.lastName}",
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: TColors.grey, fontSizeFactor: 1.1),
          );
        }
        return _buildShimmer();
      },
    );
  }

  Widget _buildShimmer() {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: ShimmerWidget(
        height: 16,
        width: 80,
        shapeBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
