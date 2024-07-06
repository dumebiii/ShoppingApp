import 'package:stacked/stacked.dart';
import 'package:stageone/app/app.locator.dart';
import 'package:stageone/app/service/shared.dart';
import 'package:stageone/model/category.dart';
import 'package:stageone/model/product.dart';

class ProductViewModel extends BaseViewModel {
  final SharedService sharedService = locator<SharedService>();

  // int _selectedIndex = 0;

  List<Category> categories = [
    Category(name: 'Main', image: 'assets/img/burger.png'),
    Category(name: 'Salads', image: 'assets/img/pizza.png'),
    Category(name: 'Soups', image: 'assets/img/meat.png'),
    Category(name: 'Drinks', image: 'assets/img/ice.png'),
  ];

  List<Product> products = [
    const Product('200', 'rice'),
    const Product('200', 'beans'),
    const Product('100', 'egg'),
    const Product('400', 'chicken'),
    const Product('600', 'Ponmo'),
    const Product('300', 'Plantain'),
  ];

  List<Product> carto = [];

  void addCart(Product item) {
    sharedService.cartt.add(item);
    notifyListeners();
  }

  void removeCart(Product product) {
    carto.remove(product);
    carto = sharedService.cartt;

    notifyListeners();
  }
}
