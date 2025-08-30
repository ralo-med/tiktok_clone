import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/login_screen.dart';
import 'package:tiktok_clone/features/authentication/username_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/auth_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/utils.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  void _onLoginTap(BuildContext context) async {
    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
      //LoginScreen에서 Navigator.pop()으로 전달된 데이터를 콘솔에 출력
    );
    print(result);
  }

  void onEmailTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const UsernameScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size40,
          ),
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Gaps.v80,
                const Text(
                  "Sign up for TikTok",
                  style: TextStyle(
                    fontSize: Sizes.size24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Gaps.v20,
                Text(
                  "Create a profile, follow other accounts, make your own videos, and more.",
                  style: TextStyle(
                    fontSize: Sizes.size16,
                    color:
                        isDarkMode(context) ? Colors.white54 : Colors.black45,
                  ),
                  textAlign: TextAlign.center,
                ),
                Gaps.v40,
                AuthButton(
                  icon: const FaIcon(FontAwesomeIcons.user),
                  text: 'Use email & password',
                  onTap: () => onEmailTap(context),
                ),
                Gaps.v10,
                const AuthButton(
                  icon: FaIcon(FontAwesomeIcons.google),
                  text: 'Continue with Google',
                ),
                Gaps.v10,
                const AuthButton(
                  icon: FaIcon(FontAwesomeIcons.apple),
                  text: 'Continue with Apple',
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: isDarkMode(context) ? Colors.black : Colors.grey.shade100,
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size32,
          horizontal: Sizes.size40,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Already have an account?',
              style: TextStyle(
                fontSize: Sizes.size16,
              ),
            ),
            Gaps.h5,
            GestureDetector(
              onTap: () => _onLoginTap(context),
              child: Text(
                'Log in',
                style: TextStyle(
                  fontSize: Sizes.size16,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
