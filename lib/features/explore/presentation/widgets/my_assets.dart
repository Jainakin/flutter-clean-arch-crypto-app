import 'package:flutter_clean_arch_crypto_app/features/explore/presentation/pages/my_assets_page.dart';

import 'asset.dart';
import 'package:flutter/material.dart';

class MyAssets extends StatelessWidget {
  const MyAssets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'My assets',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black.withOpacity(0.95),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, MyAssetsPage.routeName);
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
          const SizedBox(height: 16.0),
          const Asset(
            color: Color(0xFFF7931A),
            name: 'Bitcoin',
            symbol: 'BTC',
            asset: 'assets/icons/bitcoin.svg',
            amount: '24,500,00',
            change: '1.76',
          ),
          const SizedBox(height: 16.0),
          const Asset(
            color: Color(0xFF8247E5),
            name: 'Polygon',
            symbol: 'MATIC',
            asset: 'assets/icons/polygon.svg',
            amount: '4,500',
            change: '-6.76',
          ),
          const SizedBox(height: 16.0),
          const Asset(
            color: Color(0xFF007EFC),
            name: 'Tezos',
            symbol: 'XTZ',
            asset: 'assets/icons/tezos.svg',
            amount: '4,500',
            change: '9.06',
          ),
        ],
      ),
    );
  }
}
