import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';

class FlashModeWidget extends StatelessWidget {
  final FlashMode currentFlashMode;
  final Function(FlashMode) onFlashModeChanged;

  const FlashModeWidget({
    super.key,
    required this.currentFlashMode,
    required this.onFlashModeChanged,
  });

  Widget _buildFlashModeButton({
    required FlashMode flashMode,
    required IconData icon,
    required String tooltip,
  }) {
    final isSelected = currentFlashMode == flashMode;
    return Column(
      children: [
        IconButton(
          color: isSelected ? Colors.amber.shade200 : Colors.white,
          onPressed: () => onFlashModeChanged(flashMode),
          icon: Icon(icon),
          tooltip: tooltip,
        ),
        Gaps.v10,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildFlashModeButton(
          flashMode: FlashMode.off,
          icon: Icons.flash_off_rounded,
          tooltip: '플래시 끄기',
        ),
        _buildFlashModeButton(
          flashMode: FlashMode.always,
          icon: Icons.flash_on_rounded,
          tooltip: '플래시 항상 켜기',
        ),
        _buildFlashModeButton(
          flashMode: FlashMode.auto,
          icon: Icons.flash_auto_rounded,
          tooltip: '플래시 자동',
        ),
        _buildFlashModeButton(
          flashMode: FlashMode.torch,
          icon: Icons.flashlight_on_rounded,
          tooltip: '손전등 모드',
        ),
      ],
    );
  }
}
