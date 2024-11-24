import 'package:flutter/cupertino.dart';
import 'package:oz_cafe/app/app.dialogs.dart';
import 'package:oz_cafe/app/app.locator.dart';
import 'package:oz_cafe/app/app.router.dart';
import 'package:oz_cafe/ui/common/app_data.dart';
import 'package:oz_cafe/ui/views/item_details/item_details_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';


class CartViewModel extends BaseViewModel {
  static final _navigationService = locator<NavigationService>();

  static Future getBackToPreviousPage() async {
    _navigationService.back();
  }
}
