// Models:
import 'package:cryptocurrency_tracker/models/CryptoModel.dart';

// Screens:

// Services:

// State:

// Widgets:

// Custom:
import 'package:http/http.dart' as http;

class RESTClient {
  // ignore: non_constant_identifier_names
  final String URL;

  RESTClient(this.URL);

  //@GET:
  Future<List<Datum>> fetchAllCoins() async {
    final response = await http.get(Uri.parse(URL));
    if (response.statusCode == 200) {
      final cryptoModelData = cryptoModelFromJson(response.body);
      return cryptoModelData.data;
    } else {
      throw Exception("Failed to load!");
    }
  }
}
