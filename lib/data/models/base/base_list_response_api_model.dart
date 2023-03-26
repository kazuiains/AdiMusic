import 'dart:convert';

import 'package:musik/domain/entities/base/base_list_response_api.dart';

class BaseListResponseApiModel<T> extends BaseListResponseApi<T> {
  BaseListResponseApiModel({
    isError,
    totalResult,
    data,
  }) : super(
          isError: isError,
          totalResult: totalResult,
          data: data,
        );

  factory BaseListResponseApiModel.fromJson(
    dynamic json,
    List<T> Function(dynamic) create,
  ) {
    dynamic jsonData = jsonDecode(json);

    if (jsonData['results'] != null && jsonData['results'] is List) {
      return BaseListResponseApiModel<T>(
        data: create(jsonData['results']),
        totalResult: jsonData['resultCount'],
      );
    } else {
      return BaseListResponseApiModel<T>(
        isError: true,
      );
    }
  }
}
