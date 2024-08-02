import 'package:flutter/material.dart';

class DetailTile extends StatelessWidget {
  const DetailTile({
    super.key,
    required this.name,
    required this.value,
    this.bottomBorder = true,
  });

  final String name;
  final String value;
  final bool bottomBorder;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 1,
              child: Text(
                name,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.black.withOpacity(0.60),
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Flexible(
              flex: 3,
              child: Text(
                value,
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.black.withOpacity(0.95),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16.0),
        if (bottomBorder)
          Divider(
            color: Colors.black.withOpacity(0.08),
            thickness: 1.0,
            height: 1.0,
          ),
      ],
    );
  }
}
