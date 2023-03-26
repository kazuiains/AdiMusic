import 'package:musik/domain/entities/base/base_list_response_api.dart';
import 'package:musik/domain/entities/response/search_response.dart';

abstract class SearchRepository {
  Future<BaseListResponseApi<SearchResponse>> online(
    dynamic data,
  );

  Future<BaseListResponseApi<SearchResponse>> offline();
}
