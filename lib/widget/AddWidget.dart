import 'package:flutter/material.dart';

class AddsWidget extends StatefulWidget {
  const AddsWidget({super.key});

  @override
  State<AddsWidget> createState() => _AddsWidgetState();
}

class _AddsWidgetState extends State<AddsWidget> {
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
                child: Image.asset('assets/images/opay-logo.ico'),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Text(
                        'Install Opay now | Opay',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      Icon(Icons.more_vert),
                    ],
                  ),
                  const Text('Earn up to 15% annual interest on your savings'),
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(fontSize: 16, color: Colors.black),
                      children: [
                        TextSpan(
                          text: 'Ad .4.4 ',
                          style: TextStyle(color: Colors.white54),
                        ),
                        WidgetSpan(
                          child:
                              Icon(Icons.star, size: 16, color: Colors.yellow),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
