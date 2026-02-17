import 'package:go_router/go_router.dart';
import 'package:mobile_app/go_router/routes.dart';
import 'package:mobile_app/screens/register_screen.dart';
import 'package:mobile_app/screens/role_selecting_screen.dart';

import '../screens/login_screen.dart';

class RouterGenerationConfig {
  static GoRouter gorouter = GoRouter(
    initialLocation: AppRoutes.login,
    routes: [
      GoRoute(
    path: AppRoutes.login,
    name: '/login',
    builder: (context, state) => LoginScreen(),
  ),
      GoRoute(
        path: AppRoutes.roleSelection,
        name: '/role_selection',
        builder: (context, state) => RoleSelectionScreen(),
      ),
      GoRoute(
        path: AppRoutes.userReg,
        name: '/user_reg',
        builder: (context, state) => RegisterScreen(),
      ),


    ]
  );
}