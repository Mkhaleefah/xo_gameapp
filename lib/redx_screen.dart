import 'package:flutter/material.dart';

class RedxScreen extends StatefulWidget {
  final String winner;
  const RedxScreen({super.key, required this.winner});

  @override
  State<RedxScreen> createState() => _RedxScreenState();
}

class _RedxScreenState extends State<RedxScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        Center(
          child: Text('player wins'),
        )
      ]),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              child: Text(widget.winner),
            ),
          ),
        ],
      ),
    );
  }
}
