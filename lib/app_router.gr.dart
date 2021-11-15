// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/material.dart' as _i3;
import 'package:test_auto_route/app_router.dart' as _i4;
import 'package:test_auto_route/pages.dart' as _i1;

class AppRouter extends _i2.RootStackRouter {
  AppRouter(
      {_i3.GlobalKey<_i3.NavigatorState>? navigatorKey,
      required this.authGuard})
      : super(navigatorKey);

  final _i4.AuthGuard authGuard;

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    ListRoute.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.ListPage());
    },
    DetailsRoute.name: (routeData) {
      final pathParams = routeData.pathParams;
      final args = routeData.argsAs<DetailsRouteArgs>(
          orElse: () =>
              DetailsRouteArgs(detailsId: pathParams.getString('id')));
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i1.DetailsPage(key: args.key, detailsId: args.detailsId));
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>();
      return _i2.AdaptivePage<bool>(
          routeData: routeData,
          child: _i1.LoginPage(key: args.key, onLogin: args.onLogin));
    }
  };

  @override
  List<_i2.RouteConfig> get routes => [
        _i2.RouteConfig('/#redirect',
            path: '/', redirectTo: '/list', fullMatch: true),
        _i2.RouteConfig(ListRoute.name, path: '/list', guards: [authGuard]),
        _i2.RouteConfig(DetailsRoute.name,
            path: '/list/:id', guards: [authGuard]),
        _i2.RouteConfig(LoginRoute.name, path: '/login'),
        _i2.RouteConfig('*#redirect',
            path: '*', redirectTo: '/', fullMatch: true)
      ];
}

/// generated route for [_i1.ListPage]
class ListRoute extends _i2.PageRouteInfo<void> {
  const ListRoute() : super(name, path: '/list');

  static const String name = 'ListRoute';
}

/// generated route for [_i1.DetailsPage]
class DetailsRoute extends _i2.PageRouteInfo<DetailsRouteArgs> {
  DetailsRoute({_i3.Key? key, required String detailsId})
      : super(name,
            path: '/list/:id',
            args: DetailsRouteArgs(key: key, detailsId: detailsId),
            rawPathParams: {'id': detailsId});

  static const String name = 'DetailsRoute';
}

class DetailsRouteArgs {
  const DetailsRouteArgs({this.key, required this.detailsId});

  final _i3.Key? key;

  final String detailsId;
}

/// generated route for [_i1.LoginPage]
class LoginRoute extends _i2.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({_i3.Key? key, required void Function(String, String) onLogin})
      : super(name,
            path: '/login', args: LoginRouteArgs(key: key, onLogin: onLogin));

  static const String name = 'LoginRoute';
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key, required this.onLogin});

  final _i3.Key? key;

  final void Function(String, String) onLogin;
}
