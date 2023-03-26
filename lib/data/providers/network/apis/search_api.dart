import 'package:dio/dio.dart';
import 'package:musik/data/providers/network/api_endpoint.dart';
import 'package:musik/data/providers/network/api_provider.dart';
import 'package:musik/data/providers/network/api_request_representable.dart';

class SearchApi extends APIRequestRepresentable {
  final Map<String, String>? params;

  SearchApi({
    this.params,
  });

  @override
  String get endpoint => ApiEndpoint.endPointSearch;

  @override
  String get path => "";

  @override
  String get url => endpoint + path;

  @override
  Map<String, String>? get headers => null;

  @override
  String get contentType => Headers.jsonContentType;

  @override
  ResponseType? get responseType => null;

  @override
  get body => null;

  @override
  Map<String, String>? get query => params;

  @override
  HTTPMethod get method => HTTPMethod.get;

  @override
  String get savePath => '';

  @override
  Future request() {
    return APIProvider.instance.request(this);
  }
}
