import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marquee/marquee.dart';
import 'package:musik/app/config/app_colors.dart';
import 'package:musik/app/config/app_dimens.dart';
import 'package:musik/app/config/app_strings.dart';
import 'package:musik/domain/entities/response/search_response.dart';
import 'package:musik/presentation/get/home/home_controller.dart';
import 'package:musik/presentation/ui/pages/home/views/item_list_view.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      List<SearchResponse> items = controller.items;
      int currentPlay = controller.currentPlay;

      return Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.homeAppBarTitle),
          actions: [
            IconButton(
              tooltip: AppStrings.homeToolTipSearch,
              icon: const Icon(
                Icons.search,
              ),
              padding: EdgeInsets.zero,
              onPressed: () => controller.openSearch(context),
            ),
          ],
        ),
        body: ListView.builder(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          padding: const EdgeInsets.only(
            top: AppDimens.homeItemListViewBodyTopBottom,
            bottom: AppDimens.homeItemListViewBodyTopBottom,
          ),
          itemBuilder: (context, index) {
            var data = items[index];

            return ItemListView(
              data: data,
              isSelected: index == currentPlay,
              onTap: () => controller.onSelectMusic(
                index: index,
                data: data,
              ),
            );
          },
          itemCount: controller.count,
        ),
        bottomNavigationBar: Card(
          margin: const EdgeInsets.all(0),
          color: Colors.white,
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
                    value: 0.5,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: AppDimens.homeBottomNavBodyLeftRight,
                      left: AppDimens.homeBottomNavBodyLeftRight,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: Image.network(
                            "https://is3-ssl.mzstatic.com/image/thumb/Music125/v4/58/7f/49/587f4910-2bd8-f767-5b2a-c7e39a1f8c26/075679903440.jpg/100x100bb.jpg",
                            width: 38,
                            height: 38,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(Icons.error),
                          ),
                        ),
                        Container(
                          width: 200,
                          child: Marquee(
                            text: 'Some sample text that takes some space.',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            scrollAxis: Axis.horizontal,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            blankSpace: 10,
                            textDirection: TextDirection.ltr,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
