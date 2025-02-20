import 'package:flutter/material.dart';
import 'package:youtube_clone/constant.dart';

class CommentsWidget extends StatelessWidget {
  const CommentsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white10,
      elevation: 40,
      surfaceTintColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RichText(
              textAlign:
                  TextAlign.start, // 👈 Ensures text aligns from the left
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white54,
                ),
                children: [
                  TextSpan(text: "Comments", style: commentsTextStyle),
                  WidgetSpan(child: SizedBox(width: 6)),
                  TextSpan(text: '548', style: white54),
                ],
              ),
            ),
            Text(
                'This video really help me alot thanks flutter team for the hard work u put in'),
          ],
        ),
      ),
    );
  }
}
