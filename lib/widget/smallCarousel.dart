import 'package:flutter/material.dart';

class SmallCarousel extends StatelessWidget {
  final List<String> categories = [
    "All",
    "Music",
    "Contemporary R&B",
    "Electro-Pop",
    "Interscope Records",
    "Mixes",
    "Candlestick charts",
    "Albums",
    "Lisa",
    "African Music",
    "Drill music",
    "Podcasts",
    "Reaction videos",
    "Live",
    "APIs"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black, // Background color
      padding: EdgeInsets.symmetric(vertical: 8),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: categories.map((category) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[900], // Button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                ),
                child: Text(
                  category,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
