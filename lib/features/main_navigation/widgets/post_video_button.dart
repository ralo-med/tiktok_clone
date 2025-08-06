import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class PostVideoButton extends StatefulWidget {
  final VoidCallback? onTap;
  final bool isDarkMode;

  const PostVideoButton({
    super.key,
    this.onTap,
    this.isDarkMode = true,
  });

  @override
  State<PostVideoButton> createState() => _PostVideoButtonState();
}

class _PostVideoButtonState extends State<PostVideoButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
    _opacityAnimation = Tween<double>(
      begin: 1.0,
      end: 0.7,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _isPressed = true;
    });
    _animationController.forward();
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _isPressed = false;
    });
    _animationController.reverse();
    widget.onTap?.call();
  }

  void _onTapCancel() {
    setState(() {
      _isPressed = false;
    });
    _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: AnimatedOpacity(
              opacity: _opacityAnimation.value,
              duration: const Duration(milliseconds: 100),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    right: 20,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      height: 30,
                      width: 25,
                      padding: const EdgeInsets.symmetric(
                        horizontal: Sizes.size8,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xff61D4F0),
                        borderRadius: BorderRadius.circular(
                          Sizes.size8,
                        ),
                        boxShadow: _isPressed
                            ? [
                                BoxShadow(
                                  color: const Color(0xff61D4F0)
                                      .withValues(alpha: 0.3),
                                  blurRadius: 8,
                                  spreadRadius: 2,
                                )
                              ]
                            : null,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      height: 30,
                      width: 25,
                      padding: const EdgeInsets.symmetric(
                        horizontal: Sizes.size8,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(
                          Sizes.size8,
                        ),
                        boxShadow: _isPressed
                            ? [
                                BoxShadow(
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withValues(alpha: 0.3),
                                  blurRadius: 8,
                                  spreadRadius: 2,
                                )
                              ]
                            : null,
                      ),
                    ),
                  ),
                  Container(
                    height: 30,
                    padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.size12,
                    ),
                    decoration: BoxDecoration(
                      color: widget.isDarkMode ? Colors.white : Colors.black,
                      borderRadius: BorderRadius.circular(
                        Sizes.size6,
                      ),
                      boxShadow: _isPressed
                          ? [
                              BoxShadow(
                                color: (widget.isDarkMode
                                        ? Colors.black
                                        : Colors.white)
                                    .withValues(alpha: 0.1),
                                blurRadius: 4,
                                spreadRadius: 1,
                              )
                            ]
                          : null,
                    ),
                    child: Center(
                      child: FaIcon(
                        FontAwesomeIcons.plus,
                        color: widget.isDarkMode ? Colors.black : Colors.white,
                        size: 18,
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
