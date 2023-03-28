import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musik/app/config/app_strings.dart';
import 'package:musik/app/utils/custom_search_delegate.dart';
import 'package:musik/domain/entities/request/search_request.dart';
import 'package:musik/domain/entities/response/search_response.dart';
import 'package:musik/domain/usecases/search_music_use_case.dart';

class HomeController extends GetxController {
  HomeController({
    required this.searchUseCase,
  });

  final SearchMusicUseCase searchUseCase;

  final _listData = <SearchResponse>[].obs;

  final _isLoading = true.obs;
  final _isEmpty = false.obs;
  final _isFailed = false.obs;

  final _currentPlay = 0.obs;
  final _isPlaying = false.obs;

  final _keywordSearch = "".obs;

  @override
  void onReady() {
    super.onReady();
    searchMusic();
  }

  Future onRefresh() async {
    await searchMusic();
  }

  openSearch(BuildContext context) async {
    String? result = await showSearch(
      context: context,
      delegate: CustomSearchDelegate(),
    );

    if (result != null && result.isNotEmpty) {
      _keywordSearch.value = result;
      searchMusic();
    }
  }

  searchMusic() async {
    _isLoading(true);
    try {
      final response = await searchUseCase.execute(SearchRequest(
        term: searchAble ? keywordSearch : AppStrings.termValue,
        isOnlineData: searchAble ? true : false,
        media: AppStrings.mediaValue,
        country: AppStrings.countryValue,
      ));

      if (response.data == null) {
        _isFailed.value = true;
      } else if (response.data!.isEmpty) {
        _isEmpty.value = true;
      } else {
        List<SearchResponse> resultList = [];
        resultList.addAll(response.data!);
        _listData.value = resultList;
      }
    } catch (_) {
      _isFailed.value = true;
    }
    _isLoading(false);
  }

  onSelectMusic({
    required int index,
    required SearchResponse data,
  }) async {
    _currentPlay.value = index;
    onPlayMusic();
  }

  onPlayMusic() async {
    _isPlaying.value = !isPlaying;

    if (items.isNotEmpty) {
      SearchResponse music = items[currentPlay];

      if (isPlaying) {
        //play
      } else {
        //pause
      }
    }
  }

  openDetailMusic() async {
    Get.bottomSheet(
      Column(
        children: const [
          Expanded(
            child: Center(
              child: Text("text"),
            ),
          )
        ],
      ),
      isScrollControlled: true,
      ignoreSafeArea: false,
      backgroundColor: Colors.red,
    );
  }

  List<SearchResponse> get items => _listData.toList();

  String get keywordSearch => _keywordSearch.value;

  bool get searchAble => keywordSearch.isNotEmpty;

  int get count => _listData.length;

  int get currentPlay => _currentPlay.value;

  bool get isPlaying => _isPlaying.value;

  bool get isLoading => _isLoading.value;
}
