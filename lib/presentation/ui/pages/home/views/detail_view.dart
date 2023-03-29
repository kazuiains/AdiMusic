import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:marquee/marquee.dart';
import 'package:musik/app/config/app_colors.dart';
import 'package:musik/app/config/app_dimens.dart';
import 'package:musik/app/config/app_strings.dart';
import 'package:musik/app/config/constants/assets_constants.dart';
import 'package:musik/app/config/styles/text_styles.dart';
import 'package:musik/app/utils/helper/layout_helper.dart';
import 'package:musik/presentation/get/home/home_controller.dart';

class DetailView extends GetView<HomeController> {
  const DetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        Widget imageBackground = Image.asset(
          AssetsConstants.basicDetailImageIcon,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fitWidth,
        );

        if (controller.musicPlayingData.artworkUrl100 != null &&
            controller.musicPlayingData.artworkUrl100!.isNotEmpty) {
          imageBackground = Image.network(
            controller.musicPlayingData.artworkUrl100!,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          );
        }

        String artistName = controller.musicPlayingData.artistName ??
            AppStrings.homeItemListViewArtistNotFound;
        String collectionName = controller.musicPlayingData.collectionName ??
            AppStrings.homeItemListViewCollectionNotFound;

        String subTitle = "$artistName - $collectionName";
        String title = controller.musicPlayingData.trackName ??
            AppStrings.defaultNullValue;

        double slideValue = controller.trackValue;
        return Stack(
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
                  borderColor: Colors.black.withOpacity(0),
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
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: kToolbarHeight,
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_drop_down_rounded,
                              color: Color(0xffa2a2a2),
                              size: 50,
                            ),
                            padding: EdgeInsets.zero,
                            onPressed: () => Get.back(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 32,
                            right: 32,
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
                                    height: 28,
                                    child: _buildText(
                                      text: title,
                                      style: TextStyles.homeBottomNavTitle
                                          .copyWith(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                      maxWidth: width,
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.topLeft,
                                    width: double.infinity,
                                    height: 22,
                                    child: _buildText(
                                      text: subTitle,
                                      style: TextStyles.homeBottomNavSubTitle
                                          .copyWith(
                                        color: Color(0xffa2a2a2),
                                        fontSize: 14,
                                      ),
                                      maxWidth: width,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            left: 64,
                            right: 64,
                            top: 32,
                          ),
                          child: LayoutBuilder(
                            builder: (parent, child) {
                              double sizeImage;
                              sizeImage = child.maxWidth;

                              if (controller.musicPlayingData.artworkUrl100 ==
                                      null &&
                                  controller.musicPlayingData.artworkUrl100!
                                      .isEmpty) {
                                return ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(25),
                                  ),
                                  child: Image.network(
                                    controller.musicPlayingData.artworkUrl100!,
                                    width: sizeImage,
                                    height: sizeImage,
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            const Icon(Icons.error),
                                  ),
                                );
                              } else {
                                return ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(25),
                                  ),
                                  child: Container(
                                    width: sizeImage,
                                    height: sizeImage,
                                    color: AppColors.primary,
                                    alignment: Alignment.center,
                                    child: const Icon(
                                      Icons.music_note_rounded,
                                      color: Color(0xcbffffff),
                                      size: 100,
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(
                            left: 64,
                            right: 64,
                            top: 32,
                          ),
                          child: Row(
                            children: [
                              Text(
                                "00:00",
                                style: TextStyle(
                                  color: Color(0xcbffffff),
                                  fontSize: 10,
                                ),
                              ),
                              Expanded(
                                child: Slider(
                                  activeColor: AppColors.primary,
                                  inactiveColor: Color(0xffa2a2a2),
                                  value: slideValue,
                                  //change to duration music
                                  onChanged: (value) =>
                                      controller.onMoveTrack(value),
                                ),
                              ),
                              Text(
                                "00:00",
                                style: TextStyle(
                                  color: Color(0xcbffffff),
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(
                            left: 64,
                            right: 64,
                            top: 32,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.shuffle_rounded,
                                  color: Colors.white,
                                ),
                                padding: EdgeInsets.zero,
                                onPressed: () => Get.back(),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.repeat,
                                  color: Colors.white,
                                ),
                                padding: EdgeInsets.zero,
                                onPressed: () => Get.back(),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(
                              left: 64, right: 64, top: 32, bottom: 32),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.skip_previous_rounded,
                                  color: Colors.white,
                                  size: 40,
                                ),
                                padding: EdgeInsets.zero,
                                onPressed: () => Get.back(),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.play_arrow_rounded,
                                  color: Colors.white,
                                  size: 40,
                                ),
                                padding: EdgeInsets.zero,
                                onPressed: () => Get.back(),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.skip_next_rounded,
                                  color: Colors.white,
                                  size: 40,
                                ),
                                padding: EdgeInsets.zero,
                                onPressed: () => Get.back(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        );
      },
    );
  }

  _buildText({
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
