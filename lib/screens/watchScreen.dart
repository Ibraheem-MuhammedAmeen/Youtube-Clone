import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_clone/widget/comments.dart';
import 'package:youtube_clone/widget/task.dart';

import '../widget/videosWidget.dart';

class Watchscreen extends StatefulWidget {
  const Watchscreen(
      {required this.videoUrl,
      required this.profilePicUrl,
      required this.days,
      required this.views,
      required this.userName,
      required this.title,
      required this.suscribtion});
  final String videoUrl;
  final String profilePicUrl;
  final String userName;
  final String views;
  final String days;
  final String title;
  final String suscribtion;
  @override
  State<Watchscreen> createState() => _WatchscreenState();
}

class _WatchscreenState extends State<Watchscreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('${widget.videoUrl}')
      ..initialize().then((_) {
        setState(() {}); // Refresh UI once video is initialized
        _controller.play();
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
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            //padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                _controller.value.isInitialized
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
                    : CircularProgressIndicator(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment
                        .start, // 👈 This aligns text to the left
                    children: [
                      Text(
                        '${widget.title}',
                        textAlign:
                            TextAlign.left, // Optional now, but doesn't hurt
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(height: 5),
                      RichText(
                        textAlign: TextAlign
                            .start, // 👈 Ensures text aligns from the left
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white54,
                          ),
                          children: [
                            TextSpan(text: "${widget.views} • "),
                            TextSpan(text: '${widget.days}'),
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                      Row(
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
                            child: Row(
                              children: [
                                Text(
                                  '${widget.userName}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  '${widget.suscribtion}',
                                  style: const TextStyle(
                                    color: Colors.white54,
                                    fontSize: 13,
                                  ),
                                ),
                                Spacer(),
                                ElevatedButton(
                                  style: const ButtonStyle(
                                    backgroundColor:
                                        WidgetStatePropertyAll(Colors.white),
                                  ),
                                  onPressed: () {},
                                  child: const Text(
                                    'Subscribe',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Task(),
                CommentsWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
