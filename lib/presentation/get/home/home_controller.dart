import 'package:get/get.dart';
import 'package:musik/app/config/app_strings.dart';
import 'package:musik/domain/entities/request/search_request.dart';
import 'package:musik/domain/usecases/search_music_use_case.dart';

class HomeController extends GetxController {
  HomeController({
    required this.searchUseCase,
  });

  final SearchMusicUseCase searchUseCase;

  final _keywordSearch = "".obs;

  @override
  void onReady() {
    super.onReady();
    searchMusic();
  }

  searchMusic() async {
    try {
      final response = await searchUseCase.execute(SearchRequest(
        term: searchAble ? keywordSearch : AppStrings.termValue,
        isOnlineData: searchAble ? true : false,
        media: AppStrings.mediaValue,
        country: AppStrings.countryValue,
      ));

      if (response.data != null) {
      } else {}
    } catch (e) {}
  }

  bool get searchAble => keywordSearch.isNotEmpty;

  String get keywordSearch => _keywordSearch.value;
}
