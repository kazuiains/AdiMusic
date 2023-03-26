import 'package:musik/app/config/constants/link_page_constants.dart';

enum Flavor {
  production,
  development,
}

extension FlavorItem on Flavor {
  String get appName {
    switch (this) {
      case Flavor.production:
        return "Musik";
      case Flavor.development:
        return "Musik DEV";
    }
  }

  String get baseUrl {
    switch (this) {
      case Flavor.production:
        return baseUrlProd;
      case Flavor.development:
        return baseUrlDev;
    }
  }
}

class AppConfig {
  final Flavor flavor;
  final String appName;
  final String baseUrl;

  static AppConfig? _instance;

  AppConfig._internal(
    this.flavor,
    this.appName,
    this.baseUrl,
  );

  factory AppConfig({
    required Flavor flavor,
  }) =>
      _instance ??= AppConfig._internal(
        flavor,
        flavor.appName,
        flavor.baseUrl,
      );

  static AppConfig? get instance => _instance;
}
