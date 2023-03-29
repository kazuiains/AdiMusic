import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:musik/app/config/app_strings.dart';
import 'package:musik/app/config/constants/assets_constants.dart';
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
    Widget imageBackground = Image.asset(
      AssetsConstants.basicDetailImageIcon,
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.fitWidth,
    );

    if (musicPlayingData.artworkUrl100 != null &&
        musicPlayingData.artworkUrl100!.isNotEmpty) {
      imageBackground = Image.network(
        musicPlayingData.artworkUrl100!,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      );
    }

    Get.bottomSheet(
      Stack(
        children: [
          imageBackground,
          LayoutBuilder(
            builder: (parent, child) {
              return GlassContainer(
                height: child.maxHeight,
                width: child.maxWidth,
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.9),
                    Colors.black.withOpacity(0.92),
                    Colors.black.withOpacity(0.94),
                    Colors.black.withOpacity(0.96),
                    Colors.black.withOpacity(0.98),
                    Colors.black.withOpacity(1),
                    Colors.black.withOpacity(1),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderGradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0),
                    Colors.black.withOpacity(0),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                blur: 5.0,
                borderWidth: 0,
                elevation: 0,
                isFrostedGlass: true,
                alignment: Alignment.center,
                frostedOpacity: 0.16,
                child: SafeArea(
                  child: Container(
                    child: Text(
                      "WAAAAAA!!!!",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
      isScrollControlled: true,
      ignoreSafeArea: false,
    );
  }

  List<SearchResponse> get items => _listData.toList();

  SearchResponse get musicPlayingData =>
      items.isNotEmpty ? items[currentPlay] : SearchResponse();

  String get keywordSearch => _keywordSearch.value;

  bool get searchAble => keywordSearch.isNotEmpty;

  int get count => _listData.length;

  int get currentPlay => _currentPlay.value;

  bool get isPlaying => _isPlaying.value;

  bool get isLoading => _isLoading.value;
}
