import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ExlporeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ExlporeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      backgroundColor: Colors.white,
      leadingWidth: 40.0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: SvgPicture.asset(
          'assets/icons/scan.svg',
        ),
      ),
      title: Text(
        'Explore',
        style: TextStyle(
          fontFamily: 'Roobert',
          fontSize: 18.0,
          fontWeight: FontWeight.w700,
          color: Colors.black.withOpacity(0.95),
        ),
      ),
      centerTitle: true,
      actions: [
        SvgPicture.asset(
          'assets/icons/search.svg',
          height: 24.0,
          width: 24.0,
        ),
        const SizedBox(width: 16.0),
        SvgPicture.asset(
          'assets/icons/bell.svg',
          height: 24.0,
          width: 24.0,
        ),
        const SizedBox(width: 16.0),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
