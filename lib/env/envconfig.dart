// ignore_for_file: constant_identifier_names

class EnvironmentConfig {
  static const BASE_URL = String.fromEnvironment('BASE_URL',
      defaultValue: "https://api.themoviedb.org/3/");
  static const IMAGE_BASE_URL = String.fromEnvironment('IMAGE_BASE_URL',
      defaultValue: "https://image.tmdb.org/t/p/w185");
  static const API_KEY = String.fromEnvironment('API_KEY',
      defaultValue: "fb045666601473ee000bbbb3f85d2f4d");
}
