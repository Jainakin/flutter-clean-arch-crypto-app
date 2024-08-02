import 'package:flutter/material.dart';

import '../widgets/explore_app_bar.dart';
import '../widgets/explore_bottom_nav_bar.dart';
import '../widgets/my_assets.dart';
import '../widgets/my_balance.dart';
import '../widgets/todays_top_movers.dart';
import '../widgets/trending_news.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});
  static const String routeName = '/explore';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const ExlporeAppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16.0),
            const MyBalance(),
            const SizedBox(height: 16.0),
            const Divider(
              color: Color(0xFFF2F3F7),
              thickness: 2.0,
            ),
            const SizedBox(height: 16.0),
            const MyAssets(),
            const SizedBox(height: 16.0),
            const Divider(
              color: Color(0xFFF2F3F7),
              thickness: 2.0,
            ),
            const SizedBox(height: 16.0),
            TodaysTopMovers(),
            const SizedBox(height: 16.0),
            const Divider(
              color: Color(0xFFF2F3F7),
              thickness: 2.0,
            ),
            const SizedBox(height: 16.0),
            const TrendingNews(),
            const SizedBox(height: 8.0),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}
