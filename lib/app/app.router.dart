// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i9;
import 'package:flutter/material.dart';
import 'package:oz_cafe/ui/common/app_data.dart' as _i10;
import 'package:oz_cafe/ui/views/bottom_nav/bottom_nav_view.dart' as _i2;
import 'package:oz_cafe/ui/views/cart/cart_view.dart' as _i8;
import 'package:oz_cafe/ui/views/home/home_view.dart' as _i4;
import 'package:oz_cafe/ui/views/item_details/item_details_view.dart' as _i7;
import 'package:oz_cafe/ui/views/location/location_view.dart' as _i5;
import 'package:oz_cafe/ui/views/profile/profile_view.dart' as _i6;
import 'package:oz_cafe/ui/views/startup/startup_view.dart' as _i3;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i11;

class Routes {
  static const bottomNavView = '/bottom-nav-view';

  static const startupView = '/startup-view';

  static const homeView = '/home-view';

  static const locationView = '/location-view';

  static const profileView = '/profile-view';

  static const itemDetailsView = '/item-details-view';

  static const cartView = '/cart-view';

  static const all = <String>{
    bottomNavView,
    startupView,
    homeView,
    locationView,
    profileView,
    itemDetailsView,
    cartView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.bottomNavView,
      page: _i2.BottomNavView,
    ),
    _i1.RouteDef(
      Routes.startupView,
      page: _i3.StartupView,
    ),
    _i1.RouteDef(
      Routes.homeView,
      page: _i4.HomeView,
    ),
    _i1.RouteDef(
      Routes.locationView,
      page: _i5.LocationView,
    ),
    _i1.RouteDef(
      Routes.profileView,
      page: _i6.ProfileView,
    ),
    _i1.RouteDef(
      Routes.itemDetailsView,
      page: _i7.ItemDetailsView,
    ),
    _i1.RouteDef(
      Routes.cartView,
      page: _i8.CartView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.BottomNavView: (data) {
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.BottomNavView(),
        settings: data,
      );
    },
    _i3.StartupView: (data) {
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.StartupView(),
        settings: data,
      );
    },
    _i4.HomeView: (data) {
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.HomeView(),
        settings: data,
      );
    },
    _i5.LocationView: (data) {
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.LocationView(),
        settings: data,
      );
    },
    _i6.ProfileView: (data) {
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.ProfileView(),
        settings: data,
      );
    },
    _i7.ItemDetailsView: (data) {
      final args = data.getArgs<ItemDetailsViewArguments>(nullOk: false);
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i7.ItemDetailsView(args.menuItems, key: args.key),
        settings: data,
      );
    },
    _i8.CartView: (data) {
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.CartView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class ItemDetailsViewArguments {
  const ItemDetailsViewArguments({
    required this.menuItems,
    this.key,
  });

  final _i10.MenuData menuItems;

  final _i9.Key? key;

  @override
  String toString() {
    return '{"menuItems": "$menuItems", "key": "$key"}';
  }

  @override
  bool operator ==(covariant ItemDetailsViewArguments other) {
    if (identical(this, other)) return true;
    return other.menuItems == menuItems && other.key == key;
  }

  @override
  int get hashCode {
    return menuItems.hashCode ^ key.hashCode;
  }
}

extension NavigatorStateExtension on _i11.NavigationService {
  Future<dynamic> navigateToBottomNavView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.bottomNavView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLocationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.locationView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.profileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToItemDetailsView({
    required _i10.MenuData menuItems,
    _i9.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.itemDetailsView,
        arguments: ItemDetailsViewArguments(menuItems: menuItems, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCartView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.cartView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithBottomNavView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.bottomNavView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLocationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.locationView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.profileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithItemDetailsView({
    required _i10.MenuData menuItems,
    _i9.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.itemDetailsView,
        arguments: ItemDetailsViewArguments(menuItems: menuItems, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCartView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.cartView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
