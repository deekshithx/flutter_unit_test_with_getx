import 'package:cryptop/data/respositories/home_repository.dart';
import 'package:cryptop/domain/usecases/home_use_case.dart';
import 'package:cryptop/presentation/home/controllers/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeRepositoryImp());
    Get.lazyPut(() => FetchHomeUseCase(Get.find<HomeRepositoryImp>()));
    Get.lazyPut(() => HomeController(Get.find<FetchHomeUseCase>()));
  }
}
