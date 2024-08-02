import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    required this.onLeadingPressed,
  });

  final String title;
  final VoidCallback onLeadingPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      backgroundColor: Colors.white,
      leadingWidth: 28.0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: GestureDetector(
          onTap: onLeadingPressed,
          child: SvgPicture.asset(
            'assets/icons/chevron_left.svg',
            height: 12.0,
            width: 12.0,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.95),
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.black.withOpacity(0.95),
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
