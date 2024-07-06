import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:stageone/ui/common/app_colors.dart';
import 'package:stageone/ui/views/checkout/checkout_view.dart';
import 'package:stageone/ui/views/product/product_view.dart';

import '../../../widgets/category.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          boxShadow: [
            BoxShadow(color: klipur, spreadRadius: 0, blurRadius: 15),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: kBlack,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: viewModel.currentIndex,
            onTap: viewModel.setIndex,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: kWhite,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_basket,
                  color: kWhite,
                ),
                label: 'Checkout',
              ),
            ],
          ),
        ),
      ),
      body: getViewForIndex(viewModel.currentIndex),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();

  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return const ProductView();
      case 1:
        return const CheckoutView();

      default:
        return const ProductView();
    }
  }
}
