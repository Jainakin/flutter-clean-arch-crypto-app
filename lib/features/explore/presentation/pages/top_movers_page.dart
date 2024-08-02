import '../widgets/top_mover_tile.dart';
import '../../../../widgets/common_widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class TopMoversPage extends StatelessWidget {
  TopMoversPage({super.key});
  static const routeName = '/top_movers';

  final List<Map<String, dynamic>> topMoversData = [
    {
      'color': const Color(0xFF627EEA),
      'name': 'Ethereum',
      'asset': 'assets/icons/ethereum.svg',
      'change': '-1.76',
    },
    {
      'color': const Color(0xFFF7931A),
      'name': 'Bitcoin',
      'asset': 'assets/icons/bitcoin.svg',
      'change': '1.76',
    },
    {
      'color': const Color(0xFF3EC1BD),
      'name': 'Solana',
      'asset': 'assets/icons/solana.svg',
      'change': '1.76',
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
        child: GridView.custom(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              childAspectRatio: 1.0,
              mainAxisExtent: 130.0),
          childrenDelegate: SliverChildBuilderDelegate(
            childCount: topMoversData.length * 10,
            (context, index) {
              final asset = topMoversData[index % topMoversData.length];
              return SizedBox(
                child: TopMoverTile(
                  color: asset['color'],
                  name: asset['name'],
                  asset: asset['asset'],
                  change: asset['change'],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
