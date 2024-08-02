import 'package:flutter_clean_arch_crypto_app/features/explore/presentation/pages/explore_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../widgets/common_widgets/custom_app_bar.dart';
import '../../../../widgets/common_widgets/custom_loading_indicator.dart';
import '../provider/auth_provider.dart';
import '../widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Log in',
        onLeadingPressed: () {
          Navigator.of(context).pop();
        },
      ),
      body: SafeArea(
        child: Consumer<AuthProvider>(
          builder: (context, authProvider, child) {
            if (authProvider.status == AuthStatus.loading) {
              return const Center(
                child: CustomLoadingIndicator(),
              );
            } else if (authProvider.status == AuthStatus.error) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(authProvider.errorMessage!),
                ));
              });
            } else if (authProvider.status == AuthStatus.authenticated) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.of(context)
                    .pushReplacementNamed(ExplorePage.routeName);
              });
            }
            return const LoginForm();
          },
        ),
      ),
    );
  }
}
