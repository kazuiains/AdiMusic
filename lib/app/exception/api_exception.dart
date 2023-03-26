import 'package:musik/app/config/app_strings.dart';
import 'package:musik/app/exception/app_exception.dart';

class ApiException extends AppException {
  ApiException({
    String? code,
    String? message,
    String? details,
  }) : super(
          from: AppStrings.fromAppExceptionApi,
          code: code,
          message: message,
          details: details,
        );
}

class FetchDataException extends ApiException {
  FetchDataException(
    String? details,
  ) : super(
          code: AppStrings.codeApiExceptionFetchData,
          message: AppStrings.messageApiExceptionFetchData,
          details: details,
        );
}

class BadRequestException extends ApiException {
  BadRequestException(
    String? details,
  ) : super(
          code: AppStrings.codeApiExceptionBadRequest,
          message: AppStrings.messageApiExceptionBadRequest,
          details: details,
        );
}

class UnauthorisedException extends ApiException {
  UnauthorisedException(
    String? details,
  ) : super(
          code: AppStrings.codeApiExceptionUnauthorised,
          message: AppStrings.messageApiExceptionUnauthorised,
          details: details,
        );
}

class InvalidInputException extends ApiException {
  InvalidInputException(
    String? details,
  ) : super(
          code: AppStrings.codeApiExceptionInvalidInput,
          message: AppStrings.messageApiExceptionInvalidInput,
          details: details,
        );
}

class AuthenticationException extends ApiException {
  AuthenticationException(
    String? details,
  ) : super(
          code: AppStrings.codeApiExceptionAuthentication,
          message: AppStrings.messageApiExceptionAuthentication,
          details: details,
        );
}

class TimeOutException extends ApiException {
  TimeOutException(
    String? details,
  ) : super(
          code: AppStrings.codeApiExceptionTimeOutException,
          message: AppStrings.messageApiExceptionTimeOutException,
          details: details,
        );
}

class ApiFormatException extends ApiException {
  ApiFormatException(
    String? details,
  ) : super(
          code: AppStrings.codeApiExceptionApiFormat,
          message: AppStrings.messageApiExceptionApiFormat,
          details: details,
        );
}

class ApiRedirectException extends ApiException {
  ApiRedirectException(
    String? details,
  ) : super(
          code: AppStrings.codeApiExceptionApiRedirect,
          message: AppStrings.messageApiExceptionApiRedirect,
          details: details,
        );
}
