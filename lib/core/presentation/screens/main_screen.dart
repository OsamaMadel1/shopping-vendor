import 'package:app/core/application/navigator_provider.dart';
import 'package:app/core/presentation/components/bottom_app_bar_component.dart';
import 'package:app/settings/presentation/screens/profile_screen.dart';
import 'package:app/mangment_products/presentation/screens/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    var currentScreenIndex = ref.watch(navigationProvider);
    //var currenUser = ref.read(authNotifierProvider.notifier);

    return Scaffold(
      // floatingActionButton: MainIconButton(),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar:
          BottomAppBarComponent(currentScreenIndex: currentScreenIndex),
      body: IndexedStack(
        index: currentScreenIndex,
        children: const [
          ProductScreen(), // currentScreenIndex = 0
          Text(" OrdersScreen(),"), // currentScreenIndex = 1
          Text('ReportsScreen()'), // currentScreenIndex = 2
          Text('SalesScreen'), // currentScreenIndex = 3
          ProfileScreen(), // currentScreenIndex = 4
          // CategoriesScreen(),
        ],
      ),
    );
  }
}
