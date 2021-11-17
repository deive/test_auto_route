import 'package:flutter/material.dart';
import 'package:test_auto_route/app_router.dart';
import 'package:test_auto_route/app_router.gr.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  static final appRouter = AppRouter(authGuard: AuthGuard());

  @override
  Widget build(BuildContext context) => MaterialApp.router(
      routeInformationParser: appRouter.defaultRouteParser(),
      routerDelegate: appRouter.delegate());
}
