
import 'package:mdbee_ai/flavors.dart';

mixin EndPoints {
  static String baseUrl() {
    switch (F.appFlavor) {
      case Flavor.production:
        return "";
      default:
        return "https://mdbee-api-stage-docker.azurewebsites.net";
    }
  }
static const String loginWithMail = '/api/v1/auth/rest_auth/login/';
  static const int receiveTimeout = 10000;

  static const int connectionTimeout = 10000;
}
