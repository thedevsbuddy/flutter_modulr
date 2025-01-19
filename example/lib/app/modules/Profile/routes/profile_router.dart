import 'package:get/get.dart';

import '../profile_module.dart';

/// Defines the routes for the profile module.
class ProfileRoutes {
  static String get profile => '/profile';
}

/// Defines the routes for the profile module. This list of [GetPage] instances
/// configures the routing for the profile module, including the route for the
/// `/profile` path which maps to the [ProfilePage].
List<GetPage> profileRoutes = [
  GetPage(name: '/profile', page: () => ProfilePage()),
];
