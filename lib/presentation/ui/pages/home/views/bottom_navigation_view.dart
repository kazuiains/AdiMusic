import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:musik/app/config/app_colors.dart';
import 'package:musik/app/config/app_dimens.dart';
import 'package:musik/app/config/app_strings.dart';
import 'package:musik/app/config/constants/assets_constants.dart';
import 'package:musik/app/config/styles/text_styles.dart';
import 'package:musik/app/utils/helper/layout_helper.dart';
import 'package:musik/domain/entities/response/search_response.dart';

class BottomNavigationView extends StatelessWidget {
  final SearchResponse? data;
  final VoidCallback? onPlayMusic;
  final VoidCallback? onNextMusic;
  final GestureTapCallback? onTap;
  final bool? isPlaying;
  final double? trackValue;

  const BottomNavigationView({
    Key? key,
    this.data,
    this.onPlayMusic,
    this.onNextMusic,
    this.onTap,
    this.isPlaying,
    this.trackValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String artistName =
        data?.artistName ?? AppStrings.homeItemListViewArtistNotFound;
    String collectionName =
        data?.collectionName ?? AppStrings.homeItemListViewCollectionNotFound;

    String subTitle = "$artistName - $collectionName";
    String title = data?.trackName ?? AppStrings.defaultNullValue;

    return InkWell(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.all(0),
        color: Colors.white,
        elevation: 0,
        child: SizedBox(
          height: kBottomNavigationBarHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              PreferredSize(
                preferredSize: const Size.fromHeight(1.0),
                child: LinearProgressIndicator(
                  backgroundColor: AppColors.progressBarTrackBackgroundColor,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppColors.progressBarTrackColor,
                  ),
                  value: trackValue,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: AppDimens.homeItemListViewBodyTopBottom,
                    left: AppDimens.homeBottomNavBodyLeftRight,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        child: data != null &&
                                data!.artworkUrl100 != null &&
                                data!.artworkUrl100!.isNotEmpty
                            ? Image.network(
                                data!.artworkUrl100!,
                                width: AppDimens.homeBottomNavigationAlbumImage,
                                height:
                                    AppDimens.homeBottomNavigationAlbumImage,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    const Icon(Icons.error),
                              )
                            : Image.asset(
                                AssetsConstants.basicImageIcon,
                                width: AppDimens.homeBottomNavigationAlbumImage,
                                height:
                                    AppDimens.homeBottomNavigationAlbumImage,
                                fit: BoxFit.cover,
                              ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 16,
                            right: 16,
                          ),
                          child: LayoutBuilder(
                            builder: (parent, child) {
                              double width = child.maxWidth;
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 2),
                                    alignment: Alignment.bottomLeft,
                                    width: double.infinity,
                                    height: 19,
                                    child: buildText(
                                      text: title,
                                      style: TextStyles.homeBottomNavTitle,
                                      maxWidth: width,
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.topLeft,
                                    width: double.infinity,
                                    height: 15,
                                    child: buildText(
                                      text: subTitle,
                                      style: TextStyles.homeBottomNavSubTitle,
                                      maxWidth: width,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          isPlaying ?? false
                              ? Icons.pause_rounded
                              : Icons.play_arrow_rounded,
                        ),
                        padding: EdgeInsets.zero,
                        onPressed: onPlayMusic,
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.skip_next_rounded,
                          size: 29,
                        ),
                        padding: EdgeInsets.zero,
                        onPressed: onNextMusic,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildText({
    required String text,
    TextStyle? style,
    double maxWidth = AppDimens.maxWidthForTextMove,
  }) {
    if (LayoutHelper.isOverflow(
      text: text,
      style: style,
      maxWidth: maxWidth,
    )) {
      return Marquee(
        text: text,
        style: style,
        scrollAxis: Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.start,
        blankSpace: 10,
        textDirection: TextDirection.ltr,
      );
    } else {
      return Text(
        text,
        style: style,
        textAlign: TextAlign.start,
      );
    }
  }
}
