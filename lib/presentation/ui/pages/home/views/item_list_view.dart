import 'package:flutter/material.dart';
import 'package:musik/app/config/app_colors.dart';
import 'package:musik/app/config/app_dimens.dart';
import 'package:musik/app/config/app_strings.dart';
import 'package:musik/app/config/styles/text_styles.dart';
import 'package:musik/domain/entities/response/search_response.dart';
import 'package:musik/presentation/ui/widgets/space.dart';

class ItemListView extends StatelessWidget {
  final SearchResponse? data;
  final GestureTapCallback? onTap;
  final bool? isSelected;

  const ItemListView({
    Key? key,
    this.data,
    this.onTap,
    this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String artistName =
        data?.artistName ?? AppStrings.homeItemListViewArtistNotFound;
    String collectionName =
        data?.collectionName ?? AppStrings.homeItemListViewCollectionNotFound;
    String subTitle = "$artistName - $collectionName";
    return InkWell(
      onTap: onTap,
      overlayColor: MaterialStateProperty.all<Color>(
        Colors.black12,
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: AppDimens.homeItemListViewBodyTopBottom,
          bottom: AppDimens.homeItemListViewBodyTopBottom,
          left: AppDimens.homeItemListViewBodyLeftRight,
          right: AppDimens.homeItemListViewBodyLeftRight,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              data?.trackName ?? AppStrings.defaultNullValue,
              style: TextStyles.homeTitle.copyWith(
                color: isSelected ?? false ? AppColors.primary : AppColors.text,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Space.vSmall,
            Text(
              subTitle,
              style: TextStyles.homeSubTitle.copyWith(
                color: isSelected ?? false
                    ? AppColors.primary
                    : AppColors.text[400],
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
