import 'package:flutter_clean_arch_crypto_app/features/transactions/presentation/pages/tezos_transactions_list_page.dart';
import 'package:flutter_clean_arch_crypto_app/features/transactions/presentation/pages/transactions_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Asset extends StatelessWidget {
  const Asset({
    super.key,
    required this.color,
    required this.name,
    required this.symbol,
    required this.asset,
    required this.amount,
    required this.change,
  });

  final Color color;
  final String name;
  final String symbol;
  final String asset;
  final String amount;
  final String change;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (name == 'Bitcoin') {
          Navigator.pushNamed(context, TransactionsListPage.routeName);
        } else if (name == 'Tezos') {
          Navigator.pushNamed(context, TezosTransactionsListPage.routeName);
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 40.0,
            height: 40.0,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: SvgPicture.asset(
                asset,
                width: 20.0,
                height: 20.0,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(
                            text: '\u{20A6}',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: amount,
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      symbol,
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF9BA0A5),
                      ),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          change.contains('-')
                              ? 'assets/icons/arrow_down_right.svg'
                              : 'assets/icons/arrow_up_right.svg',
                        ),
                        const SizedBox(width: 4.0),
                        Text(
                          change.replaceFirst('-', ''),
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                            color: change.contains('-')
                                ? const Color(0xFFC00F00)
                                : const Color(0xFF12A633),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
