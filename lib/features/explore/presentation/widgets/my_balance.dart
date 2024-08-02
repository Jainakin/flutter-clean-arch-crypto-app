import 'package:flutter/material.dart';

class MyBalance extends StatefulWidget {
  const MyBalance({super.key});

  @override
  State<MyBalance> createState() => _MyBalanceState();
}

class _MyBalanceState extends State<MyBalance> {
  bool _isObscured = false;

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
                'My Balance',
                style: TextStyle(
                  fontFamily: 'Roobert',
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.black.withOpacity(0.60),
                ),
              ),
              const SizedBox(width: 8.0),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isObscured = !_isObscured;
                  });
                },
                child: Icon(
                  _isObscured ? Icons.visibility_off : Icons.remove_red_eye,
                  color: Colors.black.withOpacity(0.60),
                  size: 16.0,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '\u{20A6}',
                  style: TextStyle(
                    fontFamily: 'Roobert',
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.black.withOpacity(0.95),
                  ),
                ),
                TextSpan(
                  text: _isObscured ? '*****' : '5,000.00',
                  style: TextStyle(
                    fontFamily: 'Roobert',
                    fontSize: 32.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.black.withOpacity(0.95),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
