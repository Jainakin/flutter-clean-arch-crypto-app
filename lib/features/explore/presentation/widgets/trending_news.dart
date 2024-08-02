import 'package:flutter/material.dart';

class TrendingNews extends StatelessWidget {
  const TrendingNews({
    super.key,
  });

  final String news =
      'Ethereum Co-founder opposes El-salvador Bitcoin Adoption policy';

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
                'Trending News',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black.withOpacity(0.95),
                ),
              ),
              const Spacer(),
              const Text(
                'See all',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF12A633),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Container(
            height: 166.0,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage('assets/images/news.png'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(6.0),
            ),
          ),
          const SizedBox(height: 16.0),
          Text(
            news,
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8.0),
          const Text(
            'CoinDesk \u2022 2h',
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
              color: Color(0xFF9BA0A5),
            ),
          ),
          const SizedBox(height: 12.0),
          const NewTile(),
          const NewTile(),
          const NewTile(),
        ],
      ),
    );
  }
}

class NewTile extends StatelessWidget {
  const NewTile({super.key});

  final String news =
      'Ethereum Co-founder opposes El-salvador Bitcoin Adoption policy';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          color: Color(0xFFE3E5E6),
          thickness: 1.0,
        ),
        const SizedBox(height: 12.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 75.0,
              width: 55.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
                image: const DecorationImage(
                  image: AssetImage('assets/images/news.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    news,
                    style: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'CoinDesk \u2022 2h',
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF9BA0A5),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        const SizedBox(height: 12.0),
      ],
    );
  }
}
