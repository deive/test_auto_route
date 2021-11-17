import 'package:auto_route/auto_route.dart';
import 'package:test_auto_route/pages.dart';
import 'package:test_auto_route/app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
        path: '/list', page: ListPage, initial: true, guards: [AuthGuard]),
    AutoRoute(path: '/list/:id', page: DetailsPage, guards: [AuthGuard]),
    AutoRoute(path: '/login', page: LoginPage),
    RedirectRoute(path: '*', redirectTo: '/'),
  ],
)
// extend the generated private router
class $AppRouter {}

class AuthGuard extends AutoRouteGuard {
  bool userAuthenticated = false;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    // the navigation is paused until resolver.next() is called with either
    // true to resume/continue navigation or false to abort navigation
    if (userAuthenticated) {
      // if user is authenticated we continue
      resolver.next(true);
    } else {
      // we redirect the user to our login page
      router.push(LoginRoute(
        onLogin: () {
          userAuthenticated = true;
          resolver.next(true);
        },
      ));
    }
  }
}
