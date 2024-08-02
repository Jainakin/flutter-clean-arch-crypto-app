import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/auth_provider.dart';
import '../../../../widgets/common_widgets/rounded_input_field.dart';
import '../../../../widgets/common_widgets/rounded_text_button.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Log in to your account',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black.withOpacity(0.95)),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Welcome back! Please enter your registered email address to continue',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: Colors.black.withOpacity(0.60),
              ),
            ),
            const SizedBox(height: 32.0),
            const Text(
              'Email address',
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                color: Color(0xFF5A5A5A),
              ),
            ),
            RoundedInputField(
              controller: _emailController,
              hintText: 'Enter email',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email address';
                }
                return null;
              },
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Password',
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                color: Color(0xFF5A5A5A),
              ),
            ),
            RoundedInputField(
              controller: _passwordController,
              hintText: 'Enter password',
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
            const Spacer(),
            RoundedTextButton(
              text: 'Continue',
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Provider.of<AuthProvider>(context, listen: false).signIn(
                    email: _emailController.text,
                    password: _passwordController.text,
                  );
                }
              },
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
