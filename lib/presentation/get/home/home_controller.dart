import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musik/app/config/app_strings.dart';
import 'package:musik/app/utils/custom_search_delegate.dart';
import 'package:musik/domain/entities/request/search_request.dart';
import 'package:musik/domain/entities/response/search_response.dart';
import 'package:musik/domain/usecases/search_music_use_case.dart';
import 'package:musik/presentation/ui/pages/home/views/detail_view.dart';

class HomeController extends GetxController {
  HomeController({
    required this.searchUseCase,
  });

  final SearchMusicUseCase searchUseCase;

  final _listData = <SearchResponse>[].obs;

  final _isLoading = true.obs;
  final _isEmpty = false.obs;
  final _isFailed = false.obs;

  final player = AudioPlayer();
  final _currentPlay = 0.obs;
  final _isPlaying = false.obs;
  final _trackValue = 0.0.obs;
  final _durationTrack = 0.obs;

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
    _isPlaying.value = false;
    onPlayMusic(
      index: index,
    );
  }

  onNextMusic() async {
    if (currentPlay < maxIndex) {
      _currentPlay.value = currentPlay + 1;
      _isPlaying.value = false;
      onPlayMusic();
    }
  }

  onPrevMusic() async {
    if (currentPlay > 0) {
      _currentPlay.value = currentPlay - 1;
      _isPlaying.value = false;
      onPlayMusic();
    }
  }

  onPlayMusic({
    int? index,
  }) async {
    _isPlaying.value = !isPlaying;

    if (items.isNotEmpty) {
      SearchResponse music = items[currentPlay];

      if (isPlaying) {
        //play
        await player.play(UrlSource(music.previewUrl!));
        if (index != null && index == currentPlay) {
          player.onDurationChanged.listen(
            (duration) {
              _durationTrack.value = duration.inMicroseconds;
            },
          );

          player.onPositionChanged.listen(
            (position) {
              _trackValue.value = position.inMicroseconds / durationTrack;
            },
          );

          //       player.onPositionChanged.listen((Duration  p) => {
          //       print('Current position: $p');
          //           setState(() => position = p);
          // });
        }
      } else {
        //pause
        await player.setSourceUrl(music.previewUrl!);
        await player.pause();
      }
    }
  }

  openDetailMusic() async {
    Get.bottomSheet(
      const DetailView(),
      isScrollControlled: true,
      ignoreSafeArea: false,
    );
  }

  onMoveTrack(double value) {
    print("value: $value");
    _trackValue.value = value;
  }

  List<SearchResponse> get items => _listData.toList();

  SearchResponse get musicPlayingData =>
      items.isNotEmpty ? items[currentPlay] : SearchResponse();

  String get keywordSearch => _keywordSearch.value;

  bool get searchAble => keywordSearch.isNotEmpty;

  int get count => _listData.length;

  int get maxIndex => count != 0 ? count - 1 : 0;

  int get currentPlay => _currentPlay.value;

  bool get isPlaying => _isPlaying.value;

  double get trackValue => _trackValue.value;

  int get durationTrack => _durationTrack.value;

  bool get isLoading => _isLoading.value;
}
