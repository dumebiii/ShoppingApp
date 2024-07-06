// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:stageone/ui/common/app_colors.dart';
import 'package:stageone/ui/common/ui_helpers.dart';

import 'checkout_viewmodel.dart';

class CheckoutView extends StackedView<CheckoutViewModel> {
  const CheckoutView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CheckoutViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
            child: Padding(
          padding:
              const EdgeInsets.only(top: 10, left: 15, bottom: 15, right: 15),
          child: Column(
            children: [
              const Center(
                child: Text(
                  'CHECKOUT',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      viewModel.totalPrice == null
                          ? const Text(
                              'Total = ₦0',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800),
                            )
                          : Text(
                              'Total = ₦${viewModel.totalPrice}',
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800),
                            ),
                    ],
                  ),
                  Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.amber, // Change color as desired
                      borderRadius:
                          BorderRadius.circular(20.0), // Adjust corner radius
                    ),
                    child: const Center(
                      child: Text(
                        'Checkout now',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                ],
              ),
              verticalSpaceSmall,
              Expanded(
                  child: ListView.builder(
                      itemCount: viewModel.sharedService.cartt.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return Column(
                          children: [
                            Container(
                              height: 60,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10.0, right: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          viewModel
                                              .sharedService.cartt[index].name!
                                              .toUpperCase(),
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          "₦${viewModel.sharedService.cartt[index].price!.toString()}",
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                        ),
                                        // ignore: prefer_const_constructors
                                        GestureDetector(
                                          onTap: () {
                                            viewModel.removeCart(viewModel
                                                .sharedService.cartt[index]);
                                          },
                                          child: Icon(
                                            Icons.cancel,
                                            size: 26,
                                            color: kWhite,
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                            ),
                            verticalSpaceMedium
                          ],
                        );
                      }))
              // Expanded(
              //     // child: ListView.builder(
              //     //     itemCount: viewModel.productservice.cart,
              //     //     itemBuilder: (BuildContext ctxt, int index) {
              //     //       return
              //     //           // GestureDetector(
              //     //           // onTap: () {
              //     //           //   viewModel.handleSearchResultTap(
              //     //           //       viewModel.resulttt![index].name!,
              //     //           //       viewModel.resulttt![index].geometry!
              //     //           //           .location!.lat!,
              //     //           //       viewModel.resulttt![index].geometry!
              //     //           //           .location!.lng!);
              //     //           // },
              //     //           // child:
              //     //       //     Column(
              //     //       //   children: [
              //     //       //     Container(
              //     //       //       height: 60,
              //     //       //       width: double.infinity,
              //     //       //       decoration: BoxDecoration(
              //     //       //         color: kblue,
              //     //       //         borderRadius: BorderRadius.circular(20.0),
              //     //       //       ),
              //     //       //       child: Align(
              //     //       //         alignment: Alignment.centerLeft,
              //     //       //         child: Padding(
              //     //       //             padding: const EdgeInsets.only(
              //     //       //                 left: 10.0, right: 10),
              //     //       //             child: Text(
              //     //       //               viewModel.resulttt![index].name
              //     //       //                   .toString(),
              //     //       //               style: const TextStyle(
              //     //       //                 fontSize: 14,
              //     //       //                 fontFamily: "Poppins",
              //     //       //                 fontWeight: FontWeight.w600,
              //     //       //                 color: Colors.white,
              //     //       //               ),
              //     //       //             )),
              //     //       //       ),
              //     //       //     ),
              //     //       //     verticalSpaceMedium
              //     //       //   ],
              //     //       // );
              //     //     })
              //     )
            ],
          ),
        )));
  }

  @override
  CheckoutViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CheckoutViewModel();
}
