class Crypto {
  final String id;
  final String symbol;
  final String name;
  final double priceUsd;
  final double priceBrl;

  Crypto({
    required this.id,
    required this.symbol,
    required this.name,
    required this.priceUsd,
    required this.priceBrl,
  });

  factory Crypto.fromJson(Map<String, dynamic> json, double brlRate) {
    final quote = json['quote']['USD'];
    return Crypto(
      id: json['id'].toString(),
      symbol: json['symbol'],
      name: json['name'],
      priceUsd: quote['price'],
      priceBrl: quote['price'] * brlRate,
    );
  }
}