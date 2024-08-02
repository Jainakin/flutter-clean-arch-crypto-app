import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TopMoverTile extends StatelessWidget {
  const TopMoverTile({
    super.key,
    required this.color,
    required this.name,
    required this.asset,
    required this.change,
  });

  final Color color;
  final String name;
  final String asset;
  final String change;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      width: 150.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: Colors.black.withOpacity(0.12),
          width: 1.0,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
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
          const SizedBox(height: 8.0),
          Text(
            name,
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
              color: Colors.black.withOpacity(0.95),
            ),
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
    );
  }
}
