import 'package:Design_System/DesignSystem/design_system.dart';
import 'package:flutter/material.dart';

class BottomTabBar extends StatelessWidget {
  final BottomTabBarViewModel viewModel;
  final int currentIndex;

  const BottomTabBar._({required this.viewModel, required this.currentIndex});

  static Widget instantiate({required BottomTabBarViewModel viewModel, required int currentIndex}) {
    return BottomTabBar._(viewModel: viewModel, currentIndex: currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: viewModel.bottomTabs,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: darkPrimaryBrandColor,
      unselectedItemColor: darkPrimaryBaseColorLight,
      showUnselectedLabels: true,
      currentIndex: currentIndex,
      onTap: viewModel.onIndexChanged,
    );
  }
}