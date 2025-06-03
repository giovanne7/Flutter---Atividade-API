import '../models/crypto.dart';
import '../data/crypto_data_source.dart';

class CryptoRepository {
  final CryptoDataSource dataSource;

  CryptoRepository(this.dataSource);

  Future<List<Crypto>> getCryptos(List<String> symbols) async {
    try {
      final brlRate = await dataSource.fetchBrlRate();
      final data = await dataSource.fetchCryptoData(symbols);
      return data.map((json) => Crypto.fromJson(json, brlRate)).toList();
    } catch (e) {
      throw Exception('Error fetching crypto data: $e');
    }
  }
}