import 'package:flutter_clean_arch_crypto_app/features/transactions/presentation/pages/transaction_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../widgets/common_widgets/custom_app_bar.dart';
import '../../../../widgets/common_widgets/custom_loading_indicator.dart';
import '../provider/transactions_provider.dart';

class TransactionsListPage extends StatefulWidget {
  const TransactionsListPage({super.key});
  static const routeName = '/transactions';

  @override
  State createState() => _TransactionsListPageState();
}

class _TransactionsListPageState extends State {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      Provider.of<TransactionsProvider>(context, listen: false)
          .fetchTransactions();
    });
  }

  String _formatDateTime(int timestamp) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return '${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')} • ${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'BTC Transactions',
        onLeadingPressed: () {
          Navigator.of(context).pop();
        },
      ),
      body: Consumer<TransactionsProvider>(
        builder: (context, transactionsProvider, child) {
          if (transactionsProvider.isLoading) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomLoadingIndicator(),
                  SizedBox(height: 32.0),
                  Text(
                    'Fetching your Bitcoin transactions',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            );
          } else if (transactionsProvider.error != null) {
            return Center(
              child: Text('Error: ${transactionsProvider.error!.message}'),
            );
          } else {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: ListView.separated(
                itemCount: transactionsProvider.transactions.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16.0),
                itemBuilder: (context, index) {
                  final transaction = transactionsProvider.transactions[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        TransactionDetailsPage.routeName,
                        arguments: transaction,
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.black.withOpacity(0.08),
                            width: 1.0,
                          ),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  transaction.hash,
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black.withOpacity(0.95),
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(width: 32.0),
                              SvgPicture.asset(
                                'assets/icons/chevron_right.svg',
                                height: 12.0,
                                colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(0.52),
                                  BlendMode.srcIn,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            _formatDateTime(transaction.time),
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.black.withOpacity(0.56),
                            ),
                          ),
                          const SizedBox(height: 16.0),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
