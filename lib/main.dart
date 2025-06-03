
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodels/crypto_view_model.dart';
import 'views/crypto_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CryptoViewModel()),
      ],
      child: MaterialApp(
        title: 'Crypto App',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const CryptoListScreen(),
      ),
    );
  }
}
