import 'package:flutter/material.dart';

class RoundedInputField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData? icon;
  final bool obscureText;
  final String? Function(String?)? validator;

  const RoundedInputField({
    super.key,
    required this.controller,
    required this.hintText,
    this.icon,
    this.obscureText = false,
    this.validator,
  });

  @override
  RoundedInputFieldState createState() => RoundedInputFieldState();
}

class RoundedInputFieldState extends State<RoundedInputField> {
  bool _obscureText = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        key: widget.key,
        controller: widget.controller,
        obscureText: _obscureText,
        validator: widget.validator,
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
          color: Colors.black.withOpacity(0.95),
        ),
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            color: Color(0xFFB4B4B4),
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: widget.icon != null
              ? Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Icon(widget.icon),
                )
              : null,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: const Color(0xFFEFEFEF),
          suffixIcon: widget.obscureText
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(right: 16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'SHOW',
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF5A5A5A),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
