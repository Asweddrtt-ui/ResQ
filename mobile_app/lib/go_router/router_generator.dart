import 'package:go_router/go_router.dart';
import 'package:mobile_app/go_router/routes.dart';
import 'package:mobile_app/screens/clinic_reg.dart';
import 'package:mobile_app/screens/email_ver_screen.dart';
import 'package:mobile_app/screens/home_screen.dart';
import 'package:mobile_app/screens/identity_ver.dart';
import 'package:mobile_app/screens/shelter_reg.dart';
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
        path: AppRoutes.identityVer,
        name: '/identity_ver',
        builder: (context, state) => IdentityVerificationScreen(),
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
      GoRoute(
        path: AppRoutes.home,
        name: '/home',
        builder: (context, state) => HomeScreen(),
      ),
      GoRoute(
        path: AppRoutes.shelterReg,
        name: '/shelter_reg',
        builder: (context, state) => ShelterRegistrationScreen(),
      ),
      GoRoute(
        path: AppRoutes.clinicReg,
        name: '/clinic_reg',
        builder: (context, state) => ClinicReg(),
      ),
      GoRoute(
        path: AppRoutes.emailVer,
        name: '/email_ver',
        builder: (context, state) => EmailVerScreen(),
      ),




    ]
  );
}