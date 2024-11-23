import 'package:oz_cafe/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:oz_cafe/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:oz_cafe/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../ui/views/bottom_nav/bottom_nav_view.dart';
import 'package:oz_cafe/ui/views/home/home_view.dart';
import 'package:oz_cafe/ui/views/location/location_view.dart';
import 'package:oz_cafe/ui/views/profile/profile_view.dart';
import 'package:oz_cafe/ui/views/item_details/item_details_view.dart';
import 'package:oz_cafe/ui/views/cart/cart_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: BottomNavView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: HomeView),
    MaterialRoute(page: LocationView),
    MaterialRoute(page: ProfileView),
    MaterialRoute(page: ItemDetailsView),
    MaterialRoute(page: CartView),
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
