import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ShortsScreen extends StatefulWidget {
  const ShortsScreen({
    super.key,
    this.videoUrl,
    this.title,
    this.userName,
    this.profilePic,
  });

  final String? videoUrl;
  final String? title;
  final String? userName;
  final String? profilePic;

  @override
  State<ShortsScreen> createState() => _ShortsScreenState();
}

class _ShortsScreenState extends State<ShortsScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('${widget.videoUrl}')
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
        _controller.setLooping(true);
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    setState(() {
      _controller.value.isPlaying ? _controller.pause() : _controller.play();
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isLiked = false;
    return Scaffold(
      backgroundColor: Colors.black,
      body: _controller.value.isInitialized
          ? GestureDetector(
              onTap: _togglePlayPause,
              child: Stack(
                children: [
                  SizedBox.expand(
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: SizedBox(
                        width: _controller.value.size.width,
                        height: _controller.value.size.height,
                        child: VideoPlayer(_controller),
                      ),
                    ),
                  ),
                  if (!_controller.value.isPlaying)
                    const Center(
                      child: Icon(Icons.play_circle_fill,
                          size: 100, color: Colors.white54),
                    ),
                  Positioned(
                    right: 16,
                    bottom: 100,
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(
                            widget.profilePic ??
                                'assets/images/default_profile.png',
                          ),
                          radius: 30,
                        ),
                        const SizedBox(height: 16),
                        IconButton(
                          icon: Icon(
                            Icons.favorite,
                            color: isLiked ? Colors.red : Colors.white,
                          ),
                          iconSize: 35,
                          onPressed: () {
                            setState(() {
                              isLiked = !isLiked; // 🔄 Toggle the like state
                            });
                          },
                        ),
                        const Text('12K',
                            style: TextStyle(color: Colors.white)),
                        const SizedBox(height: 16),
                        IconButton(
                          icon: const Icon(Icons.comment, color: Colors.white),
                          iconSize: 35,
                          onPressed: () {},
                        ),
                        const Text('340',
                            style: TextStyle(color: Colors.white)),
                        const SizedBox(height: 16),
                        IconButton(
                          icon: const Icon(Icons.share, color: Colors.white),
                          iconSize: 35,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 16,
                    bottom: 40,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '@${widget.userName ?? 'Unknown'}',
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          widget.title ?? 'No Title',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
