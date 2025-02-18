import 'package:flutter/material.dart';

class AddsWidget extends StatelessWidget {
  const AddsWidget(
      {required this.title,
      required this.imageurl,
      required this.leading,
      required this.rating});
  final String imageurl;
  final String title;
  final String leading;
  final String rating;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/opay-bg.jpeg'),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(imageurl),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '$title',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      const SizedBox(
                        width: 100,
                      ),
                      Icon(Icons.more_vert),
                    ],
                  ),
                  Text('$leading'),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(fontSize: 16, color: Colors.black),
                      children: [
                        const TextSpan(
                          text: 'Ad .',
                          style: TextStyle(color: Colors.white),
                        ),
                        TextSpan(
                          text: '$rating',
                          style: TextStyle(color: Colors.white54),
                        ),
                        const WidgetSpan(
                          child:
                              Icon(Icons.star, size: 16, color: Colors.yellow),
                        ),
                        const TextSpan(
                          text: 'FREE',
                          style: TextStyle(color: Colors.white54),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey, // Change button color
                foregroundColor: Colors.white, // Text and icon color
              ),
              onPressed: () {},
              child: RichText(
                text: const TextSpan(children: [
                  TextSpan(
                    text: 'Install',
                    style: TextStyle(color: Colors.white),
                  ),
                  WidgetSpan(
                    child: Icon(Icons.download, size: 16, color: Colors.white),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
