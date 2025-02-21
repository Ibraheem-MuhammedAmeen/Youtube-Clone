import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_clone/screens/homeScreen.dart';
import 'package:youtube_clone/screens/shortsScreen.dart';

class HomeShorts extends StatefulWidget {
  HomeShorts({
    required this.title,
    required this.videoUrl,
    required this.userName,
    required this.profilePicUrl,
  });
  final String videoUrl;
  final String title;
  final String profilePicUrl;
  final String userName;

  @override
  State<HomeShorts> createState() => _HomeShortsState();
}

class _HomeShortsState extends State<HomeShorts> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('${widget.videoUrl}')
      ..initialize().then((_) {
        setState(() {}); // Refresh UI once video is initialized
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    setState(() {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ShortsScreen(
          title: widget.title,
          userName: widget.userName,
          profilePic: widget.profilePicUrl,
          videoUrl: widget.videoUrl,
        );
      }));
      //_controller.value.isPlaying ? _controller.pause() : _controller.play();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: _controller.value.isInitialized
                ? GestureDetector(
                    onTap: _togglePlayPause, // Taps to Play/Pause
                    child: AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          FittedBox(
                            fit: BoxFit
                                .cover, // 👈 Adjust this to BoxFit.fill, contain, or fitHeight as needed
                            clipBehavior:
                                Clip.hardEdge, // To ensure clipping works
                            child: SizedBox(
                              width: _controller.value.size.width,
                              height: _controller.value.size.height,
                              child: VideoPlayer(_controller),
                            ),
                          ),
                          if (!_controller.value.isPlaying)
                            Icon(Icons.play_circle_fill,
                                size: 50, color: Colors.white54),
                        ],
                      ),
                    ),
                  )
                : CircularProgressIndicator(), // Show loading spinner if video is not ready
          ),
        ),
      ],
    );
  }
}
