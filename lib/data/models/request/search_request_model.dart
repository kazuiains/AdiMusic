import 'package:musik/data/providers/network/api_parameter.dart';
import 'package:musik/domain/entities/request/search_request.dart';

class SearchRequestModel extends SearchRequest {
  SearchRequestModel({
    term,
    country,
    media,
    isOnlineData,
  }) : super(
          term: term,
          country: country,
          media: media,
          isOnlineData: isOnlineData,
        );

  _initFromEntity(SearchRequest entity) {
    term = entity.term;
    country = entity.country;
    media = entity.media;
    isOnlineData = entity.isOnlineData;
  }

  SearchRequestModel.fromDynamic(dynamic dynamicEntity) {
    var dataEntity = (dynamicEntity as SearchRequest);
    _initFromEntity(dataEntity);
  }

  SearchRequestModel.fromEntity(SearchRequest entity) {
    _initFromEntity(entity);
  }

  Map<String, String> toParams() {
    final map = <String, String>{};
    if (term != null) {
      String minimumSpace = term!.replaceAll(RegExp(' +'), ' ');
      String result = minimumSpace.replaceAll(RegExp(' '), '+');
      map[ApiParameter.keyword] = result;
    }
    if (country != null) {
      map[ApiParameter.country] = country!;
    }
    if (media != null) {
      map[ApiParameter.media] = media!;
    }
    return map;
  }
}
