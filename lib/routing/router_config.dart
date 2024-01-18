import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:practice/digiGold/digiGoldDetail.dart';
import 'package:practice/digiGold/digiGoldMainPage.dart';
import 'package:practice/digiGold/digiGoldOrderPad.dart';
import 'package:practice/digiGold/digiGoldVault.dart';
import 'package:practice/login.dart';
import 'package:practice/routing/routers.dart';
import 'package:practice/secure_Store/secureStorage.dart';
import 'package:practice/signUp.dart';
import 'package:practice/widgets/UserProcees/email.dart';
import 'package:practice/widgets/UserProcees/otp.dart';
import 'package:practice/widgets/UserProcees/password.dart';
import 'package:practice/widgets/profile_detail.dart';


SecureStorage _secureStorage = new SecureStorage();

Future<String?> _redirect(BuildContext context) async {
  final bool login;
  login = (await _secureStorage.hasToken() ? true : false);
  return login ? null : MyAppRouteConstants.login;
}

Future<String?> _forgetPassword(BuildContext context) async {
  final bool login;
  login = (await _secureStorage.hasToken() ? false : true);
  return login ? null : MyAppRouteConstants.dashboard;
}

class MyAppRoute {
  static GoRouter configureRoutes() {
    return   GoRouter(
      initialLocation:  MyAppRouteConstants.initial,
      routes: [
        GoRoute(
            name: MyAppRouteConstants.login,
            path: MyAppRouteConstants.login,
            pageBuilder: (context, state) {
              return const MaterialPage(child: Login());
            },
            redirect: ((context, state) => _forgetPassword(context))),
        GoRoute(
            name: MyAppRouteConstants.registration,
            path: MyAppRouteConstants.registration,
            pageBuilder: (context, state) {
              return const MaterialPage(child: SignUp());
            },
            redirect: ((context, state) => _forgetPassword(context))),
        GoRoute(
            name: MyAppRouteConstants.profileDetail,
            path: MyAppRouteConstants.profileDetail,
            pageBuilder: (context, state) {
              return const MaterialPage(child: ProfileDetail());
            },
            redirect: ((context, state) => _redirect(context))),
        GoRoute(
            name: '/email',
            path: '/email',
            pageBuilder: (context, state) {
              return MaterialPage(child: EmailInputWidget());
            },
            redirect: ((context, state) => _forgetPassword(context))),
        GoRoute(
            name: '/otp',
            path: '/otp',
            pageBuilder: (context, state) {
              return MaterialPage(child: OtpInputWidget());
            },
            redirect: ((context, state) => _forgetPassword(context))),
        GoRoute(
            name: '/password_reset',
            path: '/password_reset',
            pageBuilder: (context, state) {
              return MaterialPage(child: PasswordResetWidget());
            },
            redirect: ((context, state) => _forgetPassword(context))),
        GoRoute(
            name: MyAppRouteConstants.dashboard,
            path: MyAppRouteConstants.dashboard,
            pageBuilder: (context, state) {
              return const MaterialPage(child: digiGoldMainPage(index: 0,));
            },
            // redirect: ((context, state) => _redirect(context)),
            routes: <RouteBase>[
            GoRoute(
              name: "/details",
              path: "details",
              builder: (context, state) => const DigiGoldDetail(),
              // redirect: ((context, state) => _redirect(context))
            ),
            GoRoute(
              name: "/order_pad",
              path: "order_pad",
              builder: (context, state) => const digiGoldOrderPad(),
              // redirect: ((context, state) => _redirect(context))
            ),
            ]
           
            ),
           
            GoRoute(
            name: MyAppRouteConstants.home,
            path: MyAppRouteConstants.home,
            pageBuilder: (context, state) {
              return const MaterialPage(child: digiGoldVault());
            },
            
            // redirect: ((context, state) => _redirect(context))
            )
      ],
    );
  }
}
