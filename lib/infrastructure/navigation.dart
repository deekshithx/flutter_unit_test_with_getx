import 'package:cryptop/infrastructure/binding/home_binding.dart';
import 'package:cryptop/infrastructure/routes.dart';
import 'package:cryptop/presentation/home/home.dart';
import 'package:get/get.dart';

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    // GetPage(
    //   name: Routes.RESULT,
    //   page: () => const ResultScreen(),
    //   binding: ResultsBinding(),
    // ),
  ];
}
