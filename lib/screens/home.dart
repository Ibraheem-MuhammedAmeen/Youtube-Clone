import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_clone/widget/videoplayer.dart';

import '../widget/smallCarousel.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Image.asset(
            'assets/images/yt-logo.png',
            height: 100,
            width: 100,
          ),
          const Spacer(),
          Row(
            children: [
              Icon(Icons.cast, size: 30, color: Colors.white),
              SizedBox(width: 15),
              Stack(
                children: [
                  Icon(Icons.notifications_none,
                      size: 30, color: Colors.white), // Notification Icon

                  // Badge Positioned on Top
                  Positioned(
                    left: 12, // Move to the right
                    top: -7, // Move to the top
                    child: Container(
                      padding: EdgeInsets.all(4), // Padding inside the badge
                      decoration: BoxDecoration(
                        color: Colors.red, // Red notification bubble
                        borderRadius:
                            BorderRadius.circular(10), // Rounded badge
                      ),
                      constraints: BoxConstraints(
                        minWidth: 20, // Minimum width
                        minHeight: 20, // Minimum height
                      ),
                      child: Text(
                        '9+', // Notification count
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              const Icon(Icons.search, size: 30, color: Colors.white),
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SmallCarousel(),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: VideoPlayerScreen(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
