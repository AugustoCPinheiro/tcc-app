import 'package:http/http.dart';

abstract class BaseApiProvider {
  static const String _TEST_HOST = "10.0.2.2:3000";
  String _baseUrl = "http://$_TEST_HOST/";
  Client client = Client();

  Uri buildUrl(String endpoint) => Uri.parse("$_baseUrl$endpoint");
}
