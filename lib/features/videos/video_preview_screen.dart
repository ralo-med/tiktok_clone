import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gallery_saver_plus/gallery_saver.dart';
import 'package:video_player/video_player.dart';

class VideoPreviewScreen extends StatefulWidget {
  final XFile video;
  final bool isPicked;

  const VideoPreviewScreen({
    super.key,
    required this.video,
    required this.isPicked,
  });

  @override
  State<VideoPreviewScreen> createState() => _VideoPreviewScreenState();
}

class _VideoPreviewScreenState extends State<VideoPreviewScreen> {
  late final VideoPlayerController _videoPlayerController;

  bool _savedVideo = false;

  Future<void> _initVideo() async {
    _videoPlayerController = VideoPlayerController.file(
      File(widget.video.path),
    );

    await _videoPlayerController.initialize();
    await _videoPlayerController.setLooping(true);
    await _videoPlayerController.play();

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _initVideo();
  }

  Future<void> _saveToGallery() async {
    if (_savedVideo) return;

    try {
      // 임시 파일을 MP4로 복사
      final originalFile = File(widget.video.path);
      final tempDir = await Directory.systemTemp.createTemp('video_');
      final mp4File = File(
          '${tempDir.path}/video_${DateTime.now().millisecondsSinceEpoch}.mp4');

      // 파일 복사
      await originalFile.copy(mp4File.path);

      final success = await GallerySaver.saveVideo(
        mp4File.path,
        albumName: "TikTok Clone!",
      );

      // 임시 파일 정리
      await mp4File.delete();
      await tempDir.delete();

      if (success ?? false) {
        _savedVideo = true;
        setState(() {});

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('비디오가 갤러리에 저장되었습니다!'),
              backgroundColor: Colors.green,
            ),
          );
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('비디오 저장에 실패했습니다.'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('저장 중 오류가 발생했습니다: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Preview video'),
        actions: [
          if (!widget.isPicked)
            IconButton(
              onPressed: _saveToGallery,
              icon: FaIcon(
                _savedVideo
                    ? FontAwesomeIcons.check
                    : FontAwesomeIcons.download,
              ),
            )
        ],
      ),
      body: _videoPlayerController.value.isInitialized
          ? VideoPlayer(_videoPlayerController)
          : null,
    );
  }
}
