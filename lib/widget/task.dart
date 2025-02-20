import 'package:flutter/material.dart';
import 'package:youtube_clone/constant.dart';

class Task extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black, // Background color
      padding: EdgeInsets.symmetric(vertical: 8),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Card(
              child: TextButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.thumb_up,
                  color: colorWhite,
                ),
                label: Text(
                  '23k',
                  style: textWhite,
                ),
              ),
            ),
            Card(
              child: TextButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.thumb_down,
                  color: colorWhite,
                ),
                label: Text(
                  '8k',
                  style: textWhite,
                ),
              ),
            ),
            Card(
              child: TextButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.send,
                  color: colorWhite,
                ),
                label: Text(
                  'Share',
                  style: textWhite,
                ),
              ),
            ),
            Card(
              child: TextButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.download,
                  color: colorWhite,
                ),
                label: Text(
                  'Download',
                  style: textWhite,
                ),
              ),
            ),
            Card(
              child: TextButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.content_cut,
                  color: colorWhite,
                ),
                label: Text(
                  'Send',
                  style: textWhite,
                ),
              ),
            ),
            Card(
              child: TextButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.flag,
                  color: colorWhite,
                ),
                label: Text(
                  'Save',
                  style: textWhite,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
