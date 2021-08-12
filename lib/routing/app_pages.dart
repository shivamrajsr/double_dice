import 'package:double_dice/screens/dice/dicepage.dart';
import 'package:double_dice/screens/dice/dicepage_binding.dart';
import 'package:double_dice/screens/splash/splash_binding.dart';
import 'package:double_dice/screens/splash/splash_page.dart';
import 'package:get/get.dart';

part  'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.splashPage;

  static final routes = [
    GetPage(
        name: Routes.splashPage,
        page: () => SplashScreen(),
        binding: SplashBindings()),
    // GetPage(
    //   name: Routes.dicepage,
    //   page: () => DicePage(),
    //   binding: DicePageBindings(),
    // ),
  ];
}