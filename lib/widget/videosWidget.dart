import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_clone/screens/watchScreen.dart';

class VideoScreen extends StatefulWidget {
  VideoScreen(
      {required this.title,
      required this.days,
      required this.profilePicUrl,
      required this.videoUrl,
      required this.views,
      required this.userName,
      required this.suscribtion});
  final String videoUrl;
  final String title;
  final String profilePicUrl;
  final String days;
  final String views;
  final String userName;
  final String suscribtion;

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
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
        return Watchscreen(
          videoUrl: widget.videoUrl,
          profilePicUrl: widget.profilePicUrl,
          days: widget.days,
          views: widget.views,
          userName: widget.userName,
          title: widget.title,
          suscribtion: widget.suscribtion,
        );
      }));
      //_controller.value.isPlaying ? _controller.pause() : _controller.play();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                            VideoPlayer(_controller),
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Container(
                  height: 50,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(200),
                    child: Image.asset('${widget.profilePicUrl}'),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            '${widget.title}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          const Spacer(),
                          const Icon(Icons.more_vert),
                        ],
                      ),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(fontSize: 16),
                          children: [
                            TextSpan(
                              text: '${widget.userName}',
                              style: const TextStyle(color: Colors.white54),
                            ),
                            const WidgetSpan(
                              child: SizedBox(width: 5),
                            ),
                            TextSpan(
                              text: "${widget.views}",
                              style: const TextStyle(color: Colors.white54),
                            ),
                            TextSpan(
                              text: '${widget.days}',
                              style: const TextStyle(color: Colors.white54),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
