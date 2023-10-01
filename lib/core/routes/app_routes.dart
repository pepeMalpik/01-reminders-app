import 'package:go_router/go_router.dart';
import 'package:reminders_app/core/core.dart';
import 'package:reminders_app/features/dashboard/dashboard.dart';
import 'package:reminders_app/features/lists/lists.dart';

final appRoutes = [
  GoRoute(
    path: RouteLocation.dashboard,
    name: RouteLocation.dashboard,
    parentNavigatorKey: navigationKey,
    builder: DashboardPage.builder,
    routes: [
      GoRoute(
        path: RouteLocation.listCreate,
        name: RouteLocation.listCreate,
        parentNavigatorKey: navigationKey,
        builder: ListCreatePage.builder,
      ),
    ],
  ),
  // GoRoute(
  //   path: RouteLocation.listCreate,
  //   parentNavigatorKey: navigationKey,
  //   builder: CreateListPage.builder,
  // ),
];
