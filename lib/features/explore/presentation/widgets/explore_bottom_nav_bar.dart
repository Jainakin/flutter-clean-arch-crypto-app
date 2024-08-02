import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Colors.black.withOpacity(0.12),
            width: 1.0,
          ),
        ),
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedFontSize: 12.0,
        unselectedFontSize: 12.0,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: Colors.black.withOpacity(0.95),
        unselectedItemColor: Colors.black.withOpacity(0.32),
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w400,
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w400,
        ),
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 8.0, top: 12.0),
              child: SvgPicture.asset(
                'assets/icons/explore.svg',
              ),
            ),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 8.0, top: 12.0),
              child: SvgPicture.asset(
                'assets/icons/portfolio.svg',
              ),
            ),
            label: 'Protfolio',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 8.0, top: 12.0),
              child: SvgPicture.asset(
                'assets/icons/earn.svg',
              ),
            ),
            label: 'Earn',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 8.0, top: 12.0),
              child: SvgPicture.asset(
                'assets/icons/spend.svg',
              ),
            ),
            label: 'Spend',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 8.0, top: 12.0),
              child: SvgPicture.asset(
                'assets/icons/connect.svg',
              ),
            ),
            label: 'Connect',
          ),
        ],
      ),
    );
  }
}
