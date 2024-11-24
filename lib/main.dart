import 'package:flutter/material.dart';
import 'package:oz_cafe/app/app.bottomsheets.dart';
import 'package:oz_cafe/app/app.dialogs.dart';
import 'package:oz_cafe/app/app.locator.dart';
import 'package:oz_cafe/app/app.router.dart';
import 'package:oz_cafe/ui/views/cart/cart_viewmodel.dart';
import 'package:oz_cafe/ui/views/item_details/item_details_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  runApp(
    const MainApp(),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
        providers: [
        ChangeNotifierProvider(create: (_) => ItemDetailsViewModel()),
    ChangeNotifierProvider(create: (_) => CartViewModel()),
    ],
      child: MaterialApp(
        initialRoute: Routes.startupView,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: StackedRouter().onGenerateRoute,
        navigatorKey: StackedService.navigatorKey,
        navigatorObservers: [
          StackedService.routeObserver,
        ],
      ),
    );
  }
}
