import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/theme.dart';

class PersistentTabBar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final colors = Theme.of(context).extension<AppColors>()!;
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border.symmetric(
          horizontal: BorderSide(
            color: colors.border,
            width: 0.5,
          ),
        ),
      ),
      child: TabBar(
        indicatorSize: TabBarIndicatorSize.label,
        indicatorColor: colors.surfaceDark,
        labelPadding: const EdgeInsets.symmetric(
          vertical: Sizes.size10,
        ),
        labelColor: colors.surfaceDark,
        unselectedLabelColor: colors.mutedText,
        tabs: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size20,
            ),
            child: Icon(
              Icons.grid_4x4_rounded,
              color: colors.surfaceDark,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size20,
            ),
            child: FaIcon(
              FontAwesomeIcons.heart,
              color: colors.surfaceDark,
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 47;

  @override
  double get minExtent => 47;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
