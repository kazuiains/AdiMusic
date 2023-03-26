import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:musik/app/config/app_config.dart';
import 'package:musik/app/config/app_strings.dart';
import 'package:musik/app/exception/api_exception.dart';
import 'package:musik/data/providers/network/api_request_representable.dart';

class APIProvider {
  //requestTimeOut 1000000 millisecond or 16.6666667 minutes
  static const int requestTimeOut = 1000000;

  final _client = setup();

  static Dio setup() {
    Dio dio = Dio();

    dio
      ..options.baseUrl = AppConfig.instance!.baseUrl
      ..options.connectTimeout = requestTimeOut
      ..options.receiveTimeout = requestTimeOut
      ..httpClientAdapter;

    if (AppConfig.instance!.flavor == Flavor.development) {
      dio.interceptors.add(
        LogInterceptor(
          request: true,
          requestHeader: true,
          responseBody: true,
          responseHeader: true,
          requestBody: true,
          error: true,
        ),
      );
    }

    return dio;
  }

  static final _singleton = APIProvider();

  static APIProvider get instance => _singleton;

  Future request(
    APIRequestRepresentable request, {
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    bool deleteOnError = true,
    String lengthHeader = Headers.contentLengthHeader,
  }) async {
    try {
      Response response;

      var options = Options(
        headers: request.headers,
        contentType: request.contentType,
        responseType: request.responseType,
        validateStatus: (statusCode) => statusCode == 200,
      );

      switch (request.method) {
        case HTTPMethod.get:
          response = await _client.get(
            request.url,
            queryParameters: request.query,
            options: options,
            cancelToken: cancelToken,
            onReceiveProgress: onReceiveProgress,
          );
          break;
        case HTTPMethod.post:
          response = await _client.post(
            request.url,
            data: request.body,
            queryParameters: request.query,
            options: options,
            cancelToken: cancelToken,
            onReceiveProgress: onReceiveProgress,
            onSendProgress: onSendProgress,
          );
          break;
        case HTTPMethod.delete:
          response = await _client.delete(
            request.url,
            data: request.body,
            queryParameters: request.query,
            options: options,
            cancelToken: cancelToken,
          );
          break;
        case HTTPMethod.patch:
          response = await _client.patch(
            request.url,
            data: request.body,
            queryParameters: request.query,
            options: options,
            cancelToken: cancelToken,
            onReceiveProgress: onReceiveProgress,
            onSendProgress: onSendProgress,
          );
          break;
        case HTTPMethod.put:
          response = await _client.put(
            request.url,
            data: request.body,
            queryParameters: request.query,
            options: options,
            cancelToken: cancelToken,
            onReceiveProgress: onReceiveProgress,
            onSendProgress: onSendProgress,
          );
          break;
        case HTTPMethod.download:
          response = await _client.download(
            request.url,
            request.savePath,
            data: request.body,
            queryParameters: request.query,
            options: options,
            cancelToken: cancelToken,
            onReceiveProgress: onReceiveProgress,
            deleteOnError: deleteOnError,
            lengthHeader: lengthHeader,
          );
          break;
      }
      return _returnResponse(response);
    } on TimeoutException catch (e) {
      throw TimeOutException(
        e.toString(),
      );
    } on SocketException catch (e) {
      throw FetchDataException(
        e.toString(),
      );
    } on FormatException catch (e) {
      throw ApiFormatException(
        e.toString(),
      );
    } on RedirectException catch (e) {
      throw ApiRedirectException(
        e.toString(),
      );
    } catch (e) {
      throw ApiException(
        code: AppStrings.codeApiExceptionUndefined,
        message: AppStrings.messageApiExceptionUndefined,
        details: e.toString(),
      );
    }
  }

  dynamic _returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        return response.data;
      case 400:
        throw BadRequestException(
          response.data?.toString(),
        );
      case 401:
      case 403:
        throw UnauthorisedException(
          response.data?.toString(),
        );
      case 404:
        throw BadRequestException(
          AppStrings.messageStatus404,
        );
      case 500:
        throw FetchDataException(
          AppStrings.messageStatus500,
        );
      default:
        throw FetchDataException(
          '${AppStrings.messageStatusUndefined}${response.statusCode}',
        );
    }
  }
}
