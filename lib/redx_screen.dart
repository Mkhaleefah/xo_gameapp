import 'package:flutter/material.dart';
import 'package:gameee/homepage.dart';

class RedxScreen extends StatefulWidget {
  final String winner;

  const RedxScreen({
    super.key,
    required this.winner,
  });

  @override
  State<RedxScreen> createState() => _RedxScreenState();
}

class _RedxScreenState extends State<RedxScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Player Wins',
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              child: Text(
                widget.winner,
                style: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 35, vertical: 10)),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'play again',
                style: TextStyle(color: Colors.black),
              ))
        ],
      ),
    );
  }
}
