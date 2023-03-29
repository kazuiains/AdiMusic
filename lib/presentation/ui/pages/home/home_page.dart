import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musik/app/config/app_colors.dart';
import 'package:musik/app/config/app_dimens.dart';
import 'package:musik/app/config/app_strings.dart';
import 'package:musik/domain/entities/response/search_response.dart';
import 'package:musik/presentation/get/home/home_controller.dart';
import 'package:musik/presentation/ui/pages/home/views/bottom_navigation_view.dart';
import 'package:musik/presentation/ui/pages/home/views/item_list_view.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      List<SearchResponse> items = controller.items;
      int currentPlay = controller.currentPlay;

      return Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  color: AppColors.primary,
                ),
              ),
              Expanded(
                  child: Container(
                color: Colors.white,
              )),
            ],
          ),
          SafeArea(
            bottom: true,
            top: true,
            child: Scaffold(
              appBar: AppBar(
                elevation: 0,
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
              bottomNavigationBar: BottomNavigationView(
                data: items.isNotEmpty ? items[currentPlay] : null,
                onNextMusic: () => controller.openDetailMusic(),
                onTap: () => controller.openDetailMusic(),
                onPlayMusic: () => controller.onPlayMusic(),
                isPlaying: false,
                trackValue: 0.2,
              ),
            ),
          ),
        ],
      );
    });
  }
}
