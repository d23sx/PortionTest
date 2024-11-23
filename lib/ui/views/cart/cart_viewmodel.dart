import 'package:oz_cafe/app/app.router.dart';
import 'package:oz_cafe/ui/common/app_data.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class CartViewModel extends BaseViewModel {
  static final _navigationService = locator<NavigationService>();
  final List<MenuData> _cart=[];
  List<MenuData> get cart=>_cart;

  static Future getBackToHomePage() async {
    await _navigationService.navigateToBottomNavView();
  }
}
