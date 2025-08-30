import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/main_navigation/main_navigation_screen.dart';
import 'package:tiktok_clone/utils.dart';

enum Direction { right, left }

enum Page { first, second }

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  Direction _direction = Direction.right;
  Page _showingPage = Page.first;

  void _onPanUpdate(DragUpdateDetails details) {
    final newDirection =
        details.delta.dx > 0 ? Direction.right : Direction.left;

    // 방향이 실제로 변경될 때만 setState 호출
    if (newDirection != _direction) {
      setState(() {
        _direction = newDirection;
      });
    }
  }

  void _onPanEnd(DragEndDetails detail) {
    if (_direction == Direction.left) {
      setState(() {
        _showingPage = Page.second;
      });
    } else {
      setState(() {
        _showingPage = Page.first;
      });
    }
  }

  void _onEnterAppTap() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const MainNavigationScreen(),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size24),
          child: SafeArea(
            child: AnimatedCrossFade(
              firstChild: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gaps.v80,
                    Text(
                      "Watch cool videos!",
                      style: TextStyle(
                        fontSize: Sizes.size36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gaps.v16,
                    Text(
                      "Videos are personalized for you based on what you watch, like, and share.",
                      style: TextStyle(
                        fontSize: Sizes.size20,
                      ),
                    )
                  ]),
              secondChild: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gaps.v80,
                    Text(
                      "Follow the rules!",
                      style: TextStyle(
                        fontSize: Sizes.size36, // size40에서 size36으로 변경
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gaps.v16,
                    Text(
                      "Videos are personalized for you based on what you watch, like, and share.",
                      style: TextStyle(
                        fontSize: Sizes.size20,
                      ),
                    )
                  ]),
              crossFadeState: _showingPage == Page.first
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 300),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          color: isDarkMode(context) ? Colors.black : Colors.grey.shade100,
          padding: const EdgeInsets.only(
            bottom: Sizes.size32, // bottom은 그대로
            top: Sizes.size20, // top을 줄임 (32에서 16으로)
            left: Sizes.size40,
            right: Sizes.size40,
          ),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: _showingPage == Page.first ? 0 : 1, // 다시 0으로 변경
            child: GestureDetector(
              onTap: _onEnterAppTap,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: Sizes.size16,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(Sizes.size5),
                ),
                child: const Text(
                  'Enter the app!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: Sizes.size16,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
