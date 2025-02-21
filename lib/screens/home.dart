import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_clone/widget/AddWidget.dart';
import 'package:youtube_clone/widget/home_shorts.dart';
import 'package:youtube_clone/widget/videosWidget.dart';

import '../widget/smallCarousel.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
                      constraints: const BoxConstraints(
                        minWidth: 20, // Minimum width
                        minHeight: 20, // Minimum height
                      ),
                      child: const Text(
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
              const SizedBox(width: 15),
              const Icon(Icons.search, size: 30, color: Colors.white),
            ],
          )
        ],
      ),
      body: ListView(
        children: [
          SmallCarousel(),
          const SizedBox(height: 10),
          const AddsWidget(
            title: 'Install Opay now | Opay',
            imageurl: 'assets/images/opay-logo.ico',
            leading: 'Earn up to 15% annual interest on your savings',
            rating: '4.6',
          ),
          SizedBox(height: 20),
          Container(
            height: 300, // Ensure video has a fixed height
            //width: double.infinity,
            child: VideoScreen(
              title: 'video_player(Package of the Week)',
              days: ' 3 months ago',
              profilePicUrl: 'assets/images/img.png',
              videoUrl: 'assets/videos/video_player.mp4',
              views: "35K views '",
              userName: 'Flutter',
              suscribtion: '260K',
            ),
          ),
          Container(
            height: 300, // Ensure video has a fixed height
            //width: double.infinity,
            child: VideoScreen(
              title: 'Money Heist - Soundtrack',
              days: ' 3 years ago',
              profilePicUrl: 'assets/images/img_2.png',
              videoUrl: 'assets/videos/Money_Heist.mp4',
              views: "2m views '",
              userName: 'Netfix Spain',
              suscribtion: '570K',
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 18,
                ),
                //padding: const EdgeInsets.all(13.0),
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      child: Image.asset('assets/images/shorts_logo.png'),
                    ),
                    const SizedBox(width: 5),
                    const Text(
                      'Shorts',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const Spacer(),
                    const Icon(Icons.more_vert),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 300, //Ensure video has a fixed height
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(100), // Slight rounding
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: HomeShorts(
                            videoUrl:
                                'assets/videos/shorts/Davies_on_dinosaur.mp4',
                            title: 'Davies on dinosaur',
                            userName: 'Davies',
                            profilePicUrl: 'assets/images/davies.png',
                          ),
                        ),
                      ),
                    ),
                    //Text('MMMMM'),
                    Expanded(
                      child: Container(
                        height: 300, //Ensure video has a fixed height
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: HomeShorts(
                            videoUrl: 'assets/videos/shorts/samsung1.mp4',
                            title: 'Tech news',
                            userName: 'techTips',
                            profilePicUrl: 'assets/images/beast.png',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 300, //Ensure video has a fixed height
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(100), // Slight rounding
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: HomeShorts(
                            videoUrl: 'assets/videos/shorts/MrBeast_Lost.mp4',
                            title: 'How Mr beast lost \$1 Million',
                            userName: 'Mr Beast',
                            profilePicUrl: 'assets/images/beast.png',
                          ),
                        ),
                      ),
                    ),
                    //Text('MMMMM'),
                    Expanded(
                      child: Container(
                        height: 300, //Ensure video has a fixed height
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: HomeShorts(
                            videoUrl:
                                'assets/videos/shorts/BusinessmanvsEntrepreneur.mp4',
                            title: 'Business vs Entrepreneur',
                            userName: 'Trading',
                            profilePicUrl: 'assets/images/business.png',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            height: 300, // Ensure video has a fixed height
            child: VideoScreen(
              title: 'Flutter Google Map With Live\nLocation Tracking',
              days: ' 6 months',
              profilePicUrl: 'assets/images/img.png',
              videoUrl: 'assets/videos/Flutter_Google_Map.mp4',
              views: "100K views '",
              userName: 'Flutter',
              suscribtion: '260K',
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
            ],
          )
        ],
      ),
    );
  }
}
