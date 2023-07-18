//import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gameee/redx_screen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'controller/controller.dart';

class HomePage extends StatelessWidget {
  static var customFontWhite = GoogleFonts.coiny(
      textStyle: TextStyle(
    color: Colors.white,
    letterSpacing: 3,
    fontSize: 28,
  ));
  // void startTimer() {
  //   timer = Timer.periodic(Duration(seconds: 1), (_) {
  //     setState(() {
  //       if (seconds > 0) {
  //         seconds--;
  //       }
  //     });
  //   });
  // }
  Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text('TIC TAK'),
      ),
      body: GetBuilder<Controller>(builder: (controller) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              //players text

              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          'player1',
                          style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.green,
                          ),
                        ),
                        Text(
                          controller.xScore.toString(),
                          style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.green,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Column(
                      children: [
                        Text(
                          'player2',
                          style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.red,
                          ),
                        ),
                        Text(
                          controller.oScore.toString(),
                          style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.red,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              //grid boxs
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 6.0,
                        mainAxisSpacing: 9.0,
                      ),
                      itemCount: 9,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            controller.tapped(index);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                controller.displayXo[index],
                                style: GoogleFonts.coiny(fontSize: 60.0),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ),
              //after complete x & o its showing the text
              // Expanded(
              //     // flex: 2,
              //     child: Text(resulutDeclaration,
              //         style: TextStyle(color: Colors.green, fontSize: 20.0))),
              ElevatedButton(
                  onPressed: controller.clearboard,
                  child: Text(
                    'clear board',
                    style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: customFontWhite.backgroundColor,
                    ),
                  ))
            ],
          ),
        );
      }),
    );
  }

  // void _tapped(int index) {
  //   setState(() {
  //     if (oTurn && displayXo[index] == '') {
  //       displayXo[index] = 'x';
  //       filledBoxes++;
  //     } else if (!oTurn && displayXo[index] == '') {
  //       displayXo[index] = '0';
  //       filledBoxes++;
  //     }
  //     oTurn = !oTurn;
  //     _checkwinner();
  //   });
  // }
}
