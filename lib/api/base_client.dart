import 'package:http/http.dart' as http;

const String baseUrl = '';

class BaseClient{

  var client = http.Client();

  Future <dynamic> get(String api) async {
    var url = Uri.parse(api);
    client.get(url);
  }

  Future <dynamic> post(String api) async {}

  Future <dynamic> put(String api) async {}

  Future <dynamic> delete(String api) async {}

}