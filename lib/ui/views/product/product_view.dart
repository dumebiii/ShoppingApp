import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stageone/model/product.dart';
import 'package:stageone/ui/common/app_colors.dart';

import '../../../widgets/category.dart';
import 'product_viewmodel.dart';

class ProductView extends StackedView<ProductViewModel> {
  const ProductView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProductViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Padding(
          padding:
              const EdgeInsets.only(top: 20, left: 15, bottom: 15, right: 15),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Image.asset(
                'assets/img/burg.png',
                height: 24,
                width: 24,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Image.asset(
                  'assets/img/girl.png',
                  height: 50,
                  width: 50,
                ),
              )
            ]),
            const SizedBox(height: 50),
            SizedBox(
              height: 155,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: viewModel.categories.length,
                itemBuilder: (context, index) {
                  return Categoryy(
                    image: viewModel.categories[index].image,
                    name: viewModel.categories[index].name,
                  );
                },
              ),
            ),
            const Text(
              'Popular now.',
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 35,
                fontWeight: FontWeight.w500,
                color: kBlack,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 5.0,
                ),
                itemCount: viewModel.products.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 200,
                    width: 200,
                    color: Colors.amber,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          viewModel.products[index].name
                              .toString()
                              .toUpperCase(),
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "₦${viewModel.products[index].price.toString()}",
                          style: const TextStyle(
                              fontSize: 23, fontWeight: FontWeight.bold),
                        ),
                        GestureDetector(
                          onTap: () {
                            Product productt = viewModel.products[index];
                            viewModel.addCart(productt);
                            print(viewModel.carto.toString());
                          },
                          child: Container(
                            height: 50,
                            width: 70,
                            decoration: BoxDecoration(
                              color: Colors.white, // Change color as desired
                              borderRadius: BorderRadius.circular(
                                  20.0), // Adjust corner radius
                            ),
                            child: const Center(
                              child: Text(
                                'Add',
                                style: TextStyle(color: Colors.amber),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            // Container(
            //   height: 60,
            //   width: double.infinity,
            //   decoration: BoxDecoration(
            //     color: Colors.amber,
            //     borderRadius: BorderRadius.circular(20.0),
            //   ),
            //   child: Align(
            //     alignment: Alignment.centerLeft,
            //     child: Padding(
            //         padding: const EdgeInsets.only(left: 10.0, right: 10),
            //         child: Text(
            //           viewModel.carto.length.toString(),
            //           style: const TextStyle(
            //             fontSize: 14,
            //             fontFamily: "Poppins",
            //             fontWeight: FontWeight.w600,
            //             color: Colors.white,
            //           ),
            //         )),
            //   ),
            // ),
          ]),
        )),
      ),
    );
  }

  @override
  ProductViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProductViewModel();
}
