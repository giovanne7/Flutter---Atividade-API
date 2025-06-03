import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:intl/intl.dart';
import '../viewmodels/crypto_view_model.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({Key? key}) : super(key: key);

  @override
  _CryptoListScreenState createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  final TextEditingController _searchController = TextEditingController();
  final RefreshController _refreshController = RefreshController(initialRefresh: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Crypto Prices')),
      body: Consumer<CryptoViewModel>(
        builder: (context, viewModel, child) {
          return SmartRefresher(
            controller: _refreshController,
            enablePullDown: true,
            onRefresh: () async {
              await viewModel.fetchCryptos(_searchController.text);
              _refreshController.refreshCompleted();
            },
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      labelText: 'Search (e.g., BTC,ETH)',
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () => viewModel.fetchCryptos(_searchController.text),
                      ),
                    ),
                    onSubmitted: (value) => viewModel.fetchCryptos(value),
                  ),
                ),
                if (viewModel.isLoading)
                  const Center(child: CircularProgressIndicator())
                else if (viewModel.errorMessage.isNotEmpty)
                  Center(child: Text(viewModel.errorMessage))
                else
                  Expanded(
                    child: ListView.builder(
                      itemCount: viewModel.cryptos.length,
                      itemBuilder: (context, index) {
                        final crypto = viewModel.cryptos[index];
                        final usdFormat = NumberFormat.currency(locale: 'en_US', symbol: '\$');
                        final brlFormat = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
                        return ListTile(
                          title: Text('${crypto.symbol} - ${crypto.name}'),
                          subtitle: Text(
                            'USD: ${usdFormat.format(crypto.priceUsd)}\n'
                            'BRL: ${brlFormat.format(crypto.priceBrl)}',
                          ),
                        );
                      },
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}