import 'package:go_router/go_router.dart';
import 'package:mobile_app/go_router/routes.dart';
import 'package:mobile_app/screens/sign_in.dart';
import 'package:mobile_app/screens/register_screen.dart';
import 'package:mobile_app/screens/role_selecting_screen.dart';

import '../screens/welcome_screen.dart';

class RouterGenerationConfig {
  static GoRouter gorouter = GoRouter(
    initialLocation: AppRoutes.welcome,
    routes: [
      GoRoute(
    path: AppRoutes.welcome,
    name: '/welcome',
    builder: (context, state) => WelcomeScreen(),
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
      GoRoute(
        path: AppRoutes.signIn,
        name: '/sign_in',
        builder: (context, state) => SignInScreen(),
      ),


    ]
  );
}