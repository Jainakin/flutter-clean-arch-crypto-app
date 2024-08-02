import 'package:flutter_clean_arch_crypto_app/features/explore/presentation/pages/top_movers_page.dart';

import 'top_mover_tile.dart';
import 'package:flutter/material.dart';

class TodaysTopMovers extends StatelessWidget {
  TodaysTopMovers({super.key});

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Today\'s Top Movers',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black.withOpacity(0.95),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, TopMoversPage.routeName);
                },
                child: const Text(
                  'See all',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF12A633),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16.0),
        SizedBox(
          height: 130.0,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: topMoversData.length,
            separatorBuilder: (context, index) => const SizedBox(width: 16.0),
            itemBuilder: (context, index) {
              final data = topMoversData[index];
              return Padding(
                padding: EdgeInsets.only(
                  left: index == 0 ? 16.0 : 0.0,
                  right: index == topMoversData.length - 1 ? 16.0 : 0.0,
                ),
                child: TopMoverTile(
                  color: data['color'],
                  name: data['name'],
                  asset: data['asset'],
                  change: data['change'],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
