import 'package:flutter/material.dart';
import '../../../constants/sizes.dart';
import 'package:tiktok_clone/utils.dart';

class InterestButton extends StatefulWidget {
  const InterestButton({
    super.key,
    required this.interest,
    required this.isSelected,
    required this.onTap,
  });

  final String interest;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  State<InterestButton> createState() => _InterestButtonState();
}

class _InterestButtonState extends State<InterestButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size12,
          horizontal: Sizes.size24,
        ),
        decoration: BoxDecoration(
          color: widget.isSelected
              ? Theme.of(context).primaryColor
              : (isDarkMode(context) ? Colors.grey.shade800 : Colors.white),
          borderRadius: BorderRadius.circular(
            Sizes.size32,
          ),
          border: Border.all(
            color: widget.isSelected
                ? Theme.of(context).primaryColor
                : (isDarkMode(context)
                    ? Colors.grey.shade700
                    : Colors.grey.shade300),
          ),
          boxShadow: [
            BoxShadow(
              color: isDarkMode(context)
                  ? Colors.black.withAlpha(6)
                  : Colors.black.withAlpha(13),
              blurRadius: 5,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Text(
          widget.interest,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: widget.isSelected
                ? Colors.white
                : (isDarkMode(context) ? Colors.white70 : Colors.black),
          ),
        ),
      ),
    );
  }
}
