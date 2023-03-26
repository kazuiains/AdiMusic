import 'package:musik/app/core/usecases/param_usecase.dart';
import 'package:musik/domain/entities/base/base_list_response_api.dart';
import 'package:musik/domain/entities/request/search_request.dart';
import 'package:musik/domain/entities/response/search_response.dart';
import 'package:musik/domain/repositories/search_repository.dart';

class SearchMusicUseCase
    extends ParamUseCase<BaseListResponseApi<SearchResponse>, SearchRequest> {
  final SearchRepository _repo;

  SearchMusicUseCase(this._repo);

  @override
  Future<BaseListResponseApi<SearchResponse>> execute(params) async {
    BaseListResponseApi<SearchResponse>? result;
    if (params.isOnlineData != null && params.isOnlineData!) {
      result = await _repo.online(params);
    } else {
      result = await _repo.offline();
      if (result.data == null ||
          (result.data != null && result.data!.isEmpty)) {
        result = await _repo.online(params);
      }
    }
    return result;
  }
}
