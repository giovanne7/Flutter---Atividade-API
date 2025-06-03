import 'package:flutter/material.dart';
import '../models/crypto.dart';
import '../repositories/crypto_repository.dart';
import '../data/crypto_data_source.dart';

class CryptoViewModel extends ChangeNotifier {
  final CryptoRepository _repository = CryptoRepository(CryptoDataSource());
  List<Crypto> cryptos = [];
  bool isLoading = false;
  String errorMessage = '';

  final List<String> defaultSymbols = [
    'BTC', 'ETH', 'SOL', 'BNB', 'BCH', 'MKR', 'AAVE', 'DOT', 'SUI', 'ADA',
    'XRP', 'TIA', 'NEO', 'NEAR', 'PENDLE', 'RENDER', 'LINK', 'TON', 'XAI',
    'SEI', 'IMX', 'ETHFI', 'UMA', 'SUPER', 'FET', 'USUAL', 'GALA', 'PAAL', 'AERO'
  ];

  Future<void> fetchCryptos([String? query]) async {
    isLoading = true;
    errorMessage = '';
    notifyListeners();

    try {
      final symbols = query != null && query.isNotEmpty
          ? query.split(',').map((s) => s.trim().toUpperCase()).toList()
          : defaultSymbols;
      cryptos = await _repository.getCryptos(symbols);
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}