import '../../../../widgets/common_widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../domain/entities/transaction.dart';
import '../widgets/detail_tile.dart';

class TransactionDetailsPage extends StatelessWidget {
  const TransactionDetailsPage({super.key});
  static const routeName = '/transaction_details';

  String _formatDateTime(int timestamp) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return '${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')} • ${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final Transaction transaction =
        ModalRoute.of(context)!.settings.arguments as Transaction;

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
                value: _formatDateTime(transaction.time),
              ),
              DetailTile(
                name: 'Size',
                value: transaction.size.toString(),
              ),
              DetailTile(
                name: 'Block Index',
                value: transaction.blockIndex.toString(),
              ),
              DetailTile(
                name: 'Height',
                value: transaction.blockHeight.toString(),
              ),
              DetailTile(
                name: 'Received Time',
                value: _formatDateTime(transaction.time),
                bottomBorder: false,
              ),
              const SizedBox(height: 56.0),
              GestureDetector(
                onTap: () {
                  launchUrlString(
                    'https://www.blockchain.com/explorer/transactions/btc/${transaction.hash}',
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
