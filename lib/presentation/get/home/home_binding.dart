import 'package:get/get.dart';
import 'package:musik/data/repositories/search_repository_impl.dart';
import 'package:musik/domain/usecases/search_music_use_case.dart';
import 'package:musik/presentation/get/home/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    _dependencyCreator();

    _useCasePage();

    Get.put(
      HomeController(
        searchUseCase: Get.find<SearchMusicUseCase>(),
      ),
    );
  }

  _dependencyCreator() {
    Get.lazyPut(() => SearchRepositoryImpl());
  }

  _useCasePage() {
    Get.lazyPut(
      () => SearchMusicUseCase(
        Get.find<SearchRepositoryImpl>(),
      ),
    );
  }
}
