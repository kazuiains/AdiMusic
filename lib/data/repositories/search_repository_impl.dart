import 'package:musik/app/utils/helper/setting_helper.dart';
import 'package:musik/data/models/base/base_list_response_api_model.dart';
import 'package:musik/data/models/request/search_request_model.dart';
import 'package:musik/data/models/response/search_response_model.dart';
import 'package:musik/data/providers/network/apis/search_api.dart';
import 'package:musik/domain/repositories/search_repository.dart';

class SearchRepositoryImpl extends SearchRepository {
  @override
  Future<BaseListResponseApiModel<SearchResponseModel>> online(data) async {
    final request = SearchRequestModel.fromDynamic(data).toParams();
    final response = await SearchApi(
      params: request,
    ).request();

    BaseListResponseApiModel<SearchResponseModel> result =
        BaseListResponseApiModel.fromJson(
      response,
      (result) => result
          .map<SearchResponseModel>(
              (item) => SearchResponseModel.fromJson(item))
          .toList(),
    );

    if (result.data != null && result.data!.isNotEmpty) {
      SettingHelper.saveDataSearch(response);
    }

    return result;
  }

  @override
  Future<BaseListResponseApiModel<SearchResponseModel>> offline() async {
    String? response = SettingHelper.getLastSearchData();
    if (response != null && response.isNotEmpty) {
      return BaseListResponseApiModel.fromJson(
        response,
        (result) => result
            .map<SearchResponseModel>(
                (item) => SearchResponseModel.fromJson(item))
            .toList(),
      );
    } else {
      return BaseListResponseApiModel<SearchResponseModel>(
        data: <SearchResponseModel>[],
      );
    }
  }
}
