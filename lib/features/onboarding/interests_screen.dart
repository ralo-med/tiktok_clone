import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/onboarding/widgets/interest_button.dart';
import 'package:tiktok_clone/utils.dart';
import 'package:tiktok_clone/features/onboarding/turotial_screen.dart';

const interests = [
  "Daily Life",
  "Comedy",
  "Entertainment",
  "Animals",
  "Food",
  "Beauty & Style",
  "Drama",
  "Learning",
  "Talent",
  "Sports",
  "Auto",
  "Family",
  "Fitness & Health",
  "DIY & Life Hacks",
  "Arts & Crafts",
  "Dance",
  "Outdoors",
  "Oddly Satisfying",
  "Home & Garden",
  "Travel",
  "Fashion",
  "Art",
  "Music",
  "Technology",
  "Science",
  "History",
  "Education",
  "News",
  "Politics",
  "Daily Life",
  "Comedy",
  "Entertainment",
  "Animals",
  "Food",
  "Beauty & Style",
  "Drama",
  "Learning",
  "Talent",
  "Sports",
  "Auto",
  "Family",
  "Fitness & Health",
  "DIY & Life Hacks",
  "Arts & Crafts",
  "Dance",
  "Outdoors",
  "Oddly Satisfying",
  "Home & Garden",
];

class InterestsScreen extends StatefulWidget {
  const InterestsScreen({super.key});

  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  final ScrollController _scrollController = ScrollController();
  final Set<String> _selectedInterests = {};

  bool _showTitle = false;

  bool _onScrollNotification(ScrollNotification notification) {
    if (notification is ScrollUpdateNotification) {
      final shouldShowTitle = notification.metrics.pixels > 100;

      // 상태가 실제로 변경될 때만 setState 호출
      if (shouldShowTitle != _showTitle) {
        setState(() {
          _showTitle = shouldShowTitle;
        });
      }
    }
    return false;
  }

  void _onInterestTap(String interest) {
    setState(() {
      if (_selectedInterests.contains(interest)) {
        _selectedInterests.remove(interest);
      } else {
        _selectedInterests.add(interest);
      }
    });
  }

  void _onNextTap() {
    if (_selectedInterests.isEmpty) return;
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const TutorialScreen(),
      ),
      (route) => false,
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AnimatedOpacity(
          opacity: _showTitle ? 1 : 0,
          duration: const Duration(milliseconds: 300),
          child: const Text("Choose your interests"),
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
      body: Scrollbar(
        controller: _scrollController,
        child: NotificationListener<ScrollNotification>(
          onNotification: _onScrollNotification,
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Padding(
              padding: const EdgeInsets.only(
                left: Sizes.size24,
                right: Sizes.size24,
                bottom: Sizes.size16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gaps.v20,
                  const Text(
                    "Choose your interests",
                    style: TextStyle(
                      fontSize: Sizes.size40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gaps.v20,
                  const Text(
                    "Get better video recommendations",
                    style: TextStyle(
                      fontSize: Sizes.size20,
                    ),
                  ),
                  Gaps.v48,
                  Wrap(
                    runSpacing: 15,
                    spacing: 15,
                    children: [
                      for (var interest in interests)
                        InterestButton(
                          interest: interest,
                          isSelected: _selectedInterests.contains(interest),
                          onTap: () => _onInterestTap(interest),
                        )
                    ],
                  )
                ],
              ),
            ),
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
        child: GestureDetector(
          onTap: _selectedInterests.isEmpty ? null : _onNextTap,
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: Sizes.size16,
            ),
            decoration: BoxDecoration(
              color: _selectedInterests.isEmpty
                  ? (isDarkMode(context)
                      ? Colors.grey.shade800
                      : Colors.grey.shade300)
                  : Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(Sizes.size5),
            ),
            child: const Text(
              'Next',
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
    );
  }
}
