import 'package:stageone/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:stageone/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:stageone/ui/views/home/home_view.dart';
import 'package:stageone/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stageone/ui/views/checkout/checkout_view.dart';
import 'package:stageone/ui/views/product/product_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: CheckoutView),
    MaterialRoute(page: ProductView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
