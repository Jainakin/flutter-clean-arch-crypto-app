import '../../../../widgets/common_widgets/custom_app_bar.dart';

import '../../domain/entities/tezos_transaction.dart';
import '../provider/tezos_transactions_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../widgets/detail_tile.dart';

class TezosTransactionDetailsPage extends StatelessWidget {
  const TezosTransactionDetailsPage({super.key});
  static const routeName = '/tezos_transaction_details';

  String _formatDateTime(String timestamp) {
    DateTime dateTime = DateTime.parse(timestamp);
    return '${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')} • ${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final TezosTransaction transaction =
        ModalRoute.of(context)!.settings.arguments as TezosTransaction;

    TezosTransactionsProvider provider =
        Provider.of<TezosTransactionsProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Transaction Details',
        onLeadingPressed: () {
          Navigator.of(context).pop();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DetailTile(
                name: 'Hash',
                value: transaction.hash,
              ),
              DetailTile(
                name: 'Time',
                value: _formatDateTime(transaction.timestamp),
              ),
              DetailTile(
                name: 'Level',
                value: transaction.level.toString(),
              ),
              DetailTile(
                name: 'Reward',
                value: provider.blockReward.toString(),
              ),
              DetailTile(
                name: 'Bonus',
                value: provider.blockBonus.toString(),
              ),
              DetailTile(
                name: 'Fees',
                value: provider.blockFees.toString(),
                bottomBorder: false,
              ),
              const SizedBox(height: 56.0),
              GestureDetector(
                onTap: () {
                  launchUrlString(
                    'https://tzstats.com/${transaction.hash}',
                    mode: LaunchMode.externalApplication,
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/external.svg',
                      height: 18.0,
                      width: 18.0,
                      colorFilter: const ColorFilter.mode(
                        Colors.black,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Text(
                      'View on blockchain explorer',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.black.withOpacity(0.95),
                      ),
                    ),
                    const Spacer(),
                    SvgPicture.asset(
                      'assets/icons/chevron_right.svg',
                      height: 12.0,
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.32),
                        BlendMode.srcIn,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
