import 'dart:convert';
import 'package:http/http.dart' as http;

class CryptoDataSource {
  final String apiKey = 'Chave da API'; 
  final String baseUrl = 'https://pro-api.coinmarketcap.com';

  Future<List<dynamic>> fetchCryptoData(List<String> symbols) async {
    final url = Uri.parse('$baseUrl/v1/cryptocurrency/quotes/latest?symbol=${symbols.join(',')}');
    final response = await http.get(url, headers: {'X-CMC_PRO_API_KEY': apiKey});

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['data'].values.toList();
    } else {
      throw Exception('Failed to fetch crypto data: ${response.statusCode}');
    }
  }

  Future<double> fetchBrlRate() async {
    return 5.3;
  }
}