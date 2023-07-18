import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:gameee/controller/controller.dart';
import 'package:gameee/homepage.dart';
import 'package:get/get.dart';

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
  Controller controller = Get.put(Controller());

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
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                // alignment: Alignment.bottomCenter,
                child: TextButton(
                  onPressed: () {
                    controller.controllerCenter.play();
                    // Navigator.pop(context);
                  },
                  child: Text(widget.winner,
                      style: TextStyle(
                          color: Colors.amber,
                          fontWeight: FontWeight.bold,
                          fontSize: 30)),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: ConfettiWidget(
                  confettiController: controller.controllerCenter,
                  blastDirectionality: BlastDirectionality.explosive,
                  shouldLoop: false,
                  colors: const [
                    Colors.green,
                    Colors.blue,
                    Colors.pink,
                    Colors.orange,
                    Colors.purple,
                    Colors.black,
                    Colors.white,
                  ],
                ),
              ),
              // Center(
              //   child: Container(
              //     child: Text(
              //       widget.winner,
              //       style: TextStyle(
              //           color: Colors.amber,
              //           fontWeight: FontWeight.bold,
              //           fontSize: 30),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding:
                          EdgeInsets.symmetric(horizontal: 35, vertical: 10)),
                  onPressed: () {
                    Navigator.pop(context);

                    // controller.controllerCenter.play();
                  },
                  child: Text(
                    'Play Again',
                    style: TextStyle(color: Colors.black),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
