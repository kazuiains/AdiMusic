import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musik/app/config/app_strings.dart';
import 'package:musik/app/utils/custom_search_delegate.dart';
import 'package:musik/app/utils/helper/date_time_helper.dart';
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
  final _currentTrack = 0.0.obs;
  final _durationTrack = 0.0.obs;
  final _currentTrackText = '00:00'.obs;
  final _durationTrackText = '00:00'.obs;

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

        _isPlaying.value = false;
        _currentPlay.value = 0;
        _trackValue.value = 0.0;
        _currentTrack.value = 0.0;
        _durationTrack.value = 0.0;
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
    onPlayMusic();
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

  onPlayMusic() async {
    _isPlaying.value = !isPlaying;

    if (items.isNotEmpty) {
      SearchResponse music = items[currentPlay];

      if (isPlaying) {
        //play
        await player.play(UrlSource(music.previewUrl!));
        player.onDurationChanged.listen(
          (duration) {
            _durationTrack.value = duration.inSeconds.toDouble();
            _durationTrackText.value =
                DateTimeHelper.toTimeFromDuration(duration);
          },
        );

        player.onPositionChanged.listen(
          (position) {
            _currentTrack.value = position.inSeconds.toDouble();
            _currentTrackText.value =
                DateTimeHelper.toTimeFromDuration(position);
            _trackValue.value = position.inSeconds / durationTrack;
          },
        );

        player.onPlayerStateChanged.listen((PlayerState s) {});

        player.onPlayerComplete.listen((event) {
          if (currentPlay < maxIndex) {
            _durationTrack.value = 0;
            _currentTrack.value = 0;
            _trackValue.value = 0;
            onNextMusic();
          }else{
            _isPlaying.value = false;
          }
        });
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

  onMoveTrack(double value) async {
    _trackValue.value = value;
    double newValue = value * durationTrack;
    _currentTrackText.value = DateTimeHelper.toTimeFromDuration(
      Duration(
        seconds: newValue.toInt(),
      ),
    );
    await player.seek(
      Duration(
        seconds: newValue.toInt(),
      ),
    );
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

  double get currentTrack => _currentTrack.value;

  double get durationTrack => _durationTrack.value;

  String get currentTrackText => _currentTrackText.value;

  String get durationTrackText => _durationTrackText.value;

  bool get isLoading => _isLoading.value;
}
