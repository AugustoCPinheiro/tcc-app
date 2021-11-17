import 'package:http/http.dart';

abstract class BaseApiProvider {
  static const String _TEST_HOST = "10.0.2.2:3000";
  static const String _DEV_HOST = "192.168.0.196:3000";
  String _baseUrl = "http://$_DEV_HOST/";
  Client client = Client();

  Uri buildUrl(String endpoint) => Uri.parse("$_baseUrl$endpoint");
}
