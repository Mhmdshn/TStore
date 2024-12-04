import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_store/common/manager/cubits/navigation_menu_cubit.dart';
import 'package:t_store/common/widgets/navigation_menu/bottom_navigation_bar.dart';
import 'package:t_store/common/widgets/navigation_menu/navigation_body.dart';
import 'package:t_store/features/personalization/cubit/user_cubit.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<UserCubit>().fetchUserData();
    return BlocProvider(
      create: (context) => NavigationMenuCubit(),
      child: const Scaffold(
        bottomNavigationBar: TBottomNavigationBar(),
        body: TNavigationBody(),
      ),
    );
  }
}
