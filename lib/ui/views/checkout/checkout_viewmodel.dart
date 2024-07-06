import 'package:stacked/stacked.dart';
import 'package:stageone/app/app.locator.dart';
import 'package:stageone/app/service/shared.dart';
import 'package:stageone/model/product.dart';

class CheckoutViewModel extends BaseViewModel {
  final SharedService sharedService = locator<SharedService>();

  void removeCart(Product product) {
    sharedService.cartt.remove(product);

    notifyListeners();
  }

  double get totalPrice {
    double sum = 0.0;
    for (Product product in sharedService.cartt) {
      try {
        sum += double.parse(product.price!);
      } catch (e) {
        // Handle invalid price format (e.g., print an error message)
        print(
            "Error parsing price for product ${product.name}: ${product.price}");
      }
    }
    return sum;
  }

  // int getTotalPrice() {
  //   return sharedService.cartt
  //       .map((product) => product.price != null ? int.parse(product.price!) : 0)
  //       .reduce((a, b) => a + b);
  // }

  // int get totalPrice => getTotalPrice();
}
