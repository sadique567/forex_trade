import 'package:forex_trade/app/modules/alert_Notification/alert_binding/alert_binding.dart';
import 'package:forex_trade/app/modules/alert_Notification/alert_view/alert_view.dart';
import 'package:forex_trade/app/modules/buy/buy_binding/buy_binding.dart';
import 'package:forex_trade/app/modules/buy/buy_view/buy_view.dart';
import 'package:forex_trade/app/modules/dashboard/dashboard_binding/dashboard_binding.dart';
import 'package:forex_trade/app/modules/dashboard/dashboardview/dashboard_view.dart';
import 'package:forex_trade/app/modules/fund/fund_binding/fund_binding.dart';
import 'package:forex_trade/app/modules/fund/fund_view/fund_view.dart';
import 'package:forex_trade/app/modules/home/home_binding/home_binding.dart';
import 'package:forex_trade/app/modules/home/home_view/home_view.dart';
import 'package:forex_trade/app/modules/login_screen/login_binding/login_bindin.dart';
import 'package:forex_trade/app/modules/login_screen/login_view/login_view.dart';
import 'package:forex_trade/app/modules/profile/profile_binding/profile_binding.dart';
import 'package:forex_trade/app/modules/profile/profile_view/profile_view.dart';
import 'package:forex_trade/app/modules/signup_screen/signup_bindding/signup_binding.dart';
import 'package:forex_trade/app/modules/signup_screen/signup_view/signup_view.dart';
import 'package:forex_trade/app/modules/splash_screen/splash_binding/splash_binding.dart';
import 'package:forex_trade/app/modules/splash_screen/splash_view/splash_view.dart';
import 'package:forex_trade/app/modules/watchList/watchlist_binding/watchlist_binding.dart';
import 'package:forex_trade/app/modules/watchList/watchlist_view/watchlist_views.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const INITIAL_SCREEN = AppRoutes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Path.SPLASH_SCREEN,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Path.LOGIN_SCREEN,
      page: () => LoginView(),
      binding: LoginBindin(),
    ),
    GetPage(
      name: _Path.SIGNUP_SCREEN,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Path.DASHBOARD_SCREEN,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Path.PROFILE_SCREEN,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Path.HOME_SCREEN,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Path.FUND_SCREEN,
      page: () => FundView(),
      binding: FundBinding(),
    ),
    GetPage(
      name: _Path.BUY_SCREEN,
      page: () => BuyView(),
      binding: BuyBinding(),
    ),
    GetPage(
      name: _Path.WATCHLIST,
      page: () => WatchlistViews(),
      binding: WatchlistBinding(),
    ),
    GetPage(
      name: _Path.ALERT_NOTIFICATION,
      page: () => AlertView(),
      binding: AlertBinding(),
    ),
  ];
}
