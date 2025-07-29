import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

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
];

class InterestsScreen extends StatefulWidget {
  const InterestsScreen({super.key});

  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  final Set<String> _selectedInterests = {};

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
    // 여기에 다음 화면으로 이동하는 로직 추가
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose your interests"),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              left: Sizes.size24, right: Sizes.size24, bottom: Sizes.size16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v32,
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
                    GestureDetector(
                      onTap: () => _onInterestTap(interest),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: Sizes.size12,
                          horizontal: Sizes.size24,
                        ),
                        decoration: BoxDecoration(
                          color: _selectedInterests.contains(interest)
                              ? Theme.of(context).primaryColor
                              : Colors.white,
                          borderRadius: BorderRadius.circular(
                            Sizes.size32,
                          ),
                          border: Border.all(
                            color: _selectedInterests.contains(interest)
                                ? Theme.of(context).primaryColor
                                : Colors.grey.shade300,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withAlpha(13),
                              blurRadius: 5,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        child: Text(
                          interest,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: _selectedInterests.contains(interest)
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    )
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.grey.shade100,
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size32,
          horizontal: Sizes.size40,
        ),
        child: GestureDetector(
          onTap: _selectedInterests.isEmpty ? null : _onNextTap,
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: Sizes.size16,
            ),
            decoration: BoxDecoration(
              color: _selectedInterests.isEmpty
                  ? Colors.grey.shade300
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
