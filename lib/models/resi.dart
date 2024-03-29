import 'dart:convert';
import 'package:http/http.dart' as http;

class Resi {
  final apiKey = 'Api Key'; // masukkan api key yang diberikan oleh binderbyte
  Future<Map<String, dynamic>> cekResi(String kurir, String resi) async {
    var response = await http.get(
      Uri.parse(
        // ignore: unnecessary_brace_in_string_interps
        'https://api.binderbyte.com/v1/track?api_key=${apiKey}&courier=${kurir}&awb=${resi}',
      ),
    );
    return json.decode(response.body);
  }
}
