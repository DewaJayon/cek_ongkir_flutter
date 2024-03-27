import 'dart:convert';
import 'package:http/http.dart' as http;

class Resi {
  final apiKey =
      '6f479a3d08d58ebd60717dc4142267f7d004c40679b6f77a68ee8ad9e94c484a';
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
