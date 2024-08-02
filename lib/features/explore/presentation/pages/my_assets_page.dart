import '../widgets/asset.dart';
import '../../../../widgets/common_widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class MyAssetsPage extends StatelessWidget {
  MyAssetsPage({super.key});
  static const routeName = '/my_assets';

  final List<Map<String, dynamic>> myAssetsData = [
    {
      'color': const Color(0xFFF7931A),
      'name': 'Bitcoin',
      'symbol': 'BTC',
      'asset': 'assets/icons/bitcoin.svg',
      'amount': '24,500,00',
      'change': '1.76',
    },
    {
      'color': const Color(0xFF8247E5),
      'name': 'Polygon',
      'symbol': 'MATIC',
      'asset': 'assets/icons/polygon.svg',
      'amount': '4,500',
      'change': '-6.76',
    },
    {
      'color': const Color(0xFF007EFC),
      'name': 'Tezos',
      'symbol': 'XTZ',
      'asset': 'assets/icons/tezos.svg',
      'amount': '4,500',
      'change': '9.06',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
          title: 'My assets',
          onLeadingPressed: () {
            Navigator.pop(context);
          }),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
        child: ListView.separated(
          itemCount: myAssetsData.length * 10,
          separatorBuilder: (_, __) => const SizedBox(height: 16.0),
          itemBuilder: (_, index) {
            final asset = myAssetsData[index % myAssetsData.length];
            return Asset(
              color: asset['color'],
              name: asset['name'],
              symbol: asset['symbol'],
              asset: asset['asset'],
              amount: asset['amount'],
              change: asset['change'],
            );
          },
        ),
      ),
    );
  }
}
