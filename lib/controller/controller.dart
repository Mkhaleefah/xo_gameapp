import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:gameee/redx_screen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Controller extends GetxController {
  late ConfettiController controllerCenter;
  late ConfettiController controllerCenterRight;
  late ConfettiController controllerCenterLeft;
  late ConfettiController controllerTopCenter;
  late ConfettiController controllerBottomCenter;
  @override
  void onInit() {
    controllerCenter = ConfettiController(duration: const Duration(seconds: 3));
    controllerCenterRight =
        ConfettiController(duration: const Duration(seconds: 3));
    controllerCenterLeft =
        ConfettiController(duration: const Duration(seconds: 3));
    controllerTopCenter =
        ConfettiController(duration: const Duration(seconds: 3));
    controllerBottomCenter =
        ConfettiController(duration: const Duration(seconds: 3));
    controllerCenter.play();
    // TODO: implement onInit
    super.onInit();
  }

  // @override
  // void dispose() {
  //   controllerCenter.dispose();
  //    super.dispose();
  // }
  bool oTurn = false;
  List<String> displayXo = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  void clearboard() {
    displayXo = [
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
    ];
    oScore = 0;
    xScore = 0;
    filledBoxes = 0;
    resulutDeclaration = '';
    winnerFound = false;
    oTurn = false;
    update();
  }

  int oScore = 0;
  int xScore = 0;
  int filledBoxes = 0;
  String resulutDeclaration = '';
  bool winnerFound = false;
  // static const maxSeconds = 30;
  // int seconds = maxSeconds;
  // Timer? timer;
  void tapped(int index) {
    //  setState(() {
    if (displayXo[index] == '') {
      if (!oTurn) {
        print("X Turn");
        displayXo[index] = 'x';
        // filledBoxes++;
      } else {
        print("O Turn");
        displayXo[index] = 'o';

        // filledBoxes++;
      }
      filledBoxes++;
      oTurn = !oTurn;
      _checkwinner();
    }
    update();
    // });
  }

  void _checkwinner() {
    //check 1row
    if (displayXo[0] == displayXo[1] &&
        displayXo[0] == displayXo[2] &&
        displayXo[0] != '') {
      //  setState(() {
      _updateScore(displayXo[0]);
      resulutDeclaration = 'Player' + displayXo[0] + 'Wins!';
      update();
      controllerCenter.play();
      Get.to(() => RedxScreen(winner: resulutDeclaration));
      // Navigator.of(context).push(MaterialPageRoute(
      //     builder: (context) => RedxScreen(
      //           // displayXo: resulutDeclaration,
      //           winner: resulutDeclaration,
      //         )));
      // });
    }
    //check 2row
    if (displayXo[3] == displayXo[4] &&
        displayXo[3] == displayXo[5] &&
        displayXo[3] != '') {
      //  setState(() {
      _updateScore(displayXo[3]);
      resulutDeclaration = 'Player' + displayXo[3] + 'Wins!';
      update();
      controllerCenter.play();
      Get.to(() => RedxScreen(winner: resulutDeclaration));
      // Navigator.of(context).push(MaterialPageRoute(
      //     builder: (context) => RedxScreen(
      //           // displayXo: resulutDeclaration,
      //           winner: resulutDeclaration,
      //         )));
      // });
    }
    //check 3row
    if (displayXo[6] == displayXo[7] &&
        displayXo[6] == displayXo[8] &&
        displayXo[6] != '') {
      // setState(() {
      _updateScore(displayXo[6]);
      resulutDeclaration = 'Player' + displayXo[6] + 'Wins!';
      update();
      controllerCenter.play();
      Get.to(() => RedxScreen(winner: resulutDeclaration));
      // Navigator.of(context).push(MaterialPageRoute(
      //     builder: (context) => RedxScreen(
      //           // displayXo: resulutDeclaration,
      //           winner: resulutDeclaration,
      //         )));
      // });
    }
    //check 1column
    if (displayXo[0] == displayXo[3] &&
        displayXo[0] == displayXo[6] &&
        displayXo[0] != '') {
      // setState(() {
      _updateScore(displayXo[0]);
      resulutDeclaration = 'Player' + displayXo[0] + 'Wins!';
      update();
      controllerCenter.play();
      Get.to(() => RedxScreen(winner: resulutDeclaration));
      // Navigator.of(context).push(MaterialPageRoute(
      //     builder: (context) => RedxScreen(
      //           // displayXo: resulutDeclaration,
      //           winner: resulutDeclaration,
      //         )));
      // });
    }
    //check 2column
    if (displayXo[1] == displayXo[4] &&
        displayXo[1] == displayXo[7] &&
        displayXo[1] != '') {
      // setState(() {
      _updateScore(displayXo[1]);
      resulutDeclaration = 'Player' + displayXo[1] + 'Wins!';
      update();
      controllerCenter.play();
      Get.to(() => RedxScreen(winner: resulutDeclaration));
      // Navigator.of(context).push(MaterialPageRoute(
      //     builder: (context) => RedxScreen(
      //           // displayXo: resulutDeclaration,
      //           winner: resulutDeclaration,
      //         )));
      // });
    }
    //check 3column
    if (displayXo[2] == displayXo[5] &&
        displayXo[2] == displayXo[8] &&
        displayXo[2] != '') {
      // setState(() {
      _updateScore(displayXo[2]);
      resulutDeclaration = 'Player' + displayXo[2] + 'Wins!';
      update();
      controllerCenter.play();
      Get.to(() => RedxScreen(winner: resulutDeclaration));
      // Navigator.of(context).push(MaterialPageRoute(
      //     builder: (context) => RedxScreen(
      //           // displayXo: resulutDeclaration,
      //           winner: resulutDeclaration,
      //         )));
      // });
    }
    //check dignal
    if (displayXo[0] == displayXo[4] &&
        displayXo[0] == displayXo[8] &&
        displayXo[0] != '') {
      // setState(() {
      _updateScore(displayXo[0]);
      resulutDeclaration = 'Player' + displayXo[0] + 'Wins!';
      update();
      controllerCenter.play();
      Get.to(() => RedxScreen(winner: resulutDeclaration));
      // Navigator.of(context).push(MaterialPageRoute(
      //     builder: (context) => RedxScreen(
      //           // displayXo: resulutDeclaration,
      //           winner: resulutDeclaration,
      //         )));
      // });
    }
    //check dignal
    if (displayXo[6] == displayXo[4] &&
        displayXo[6] == displayXo[2] &&
        displayXo[6] != '') {
      // setState(() {
      _updateScore(displayXo[6]);
      resulutDeclaration = 'Player' + displayXo[6] + 'Wins!';
      update();
      controllerCenter.play();
      Get.to(() => RedxScreen(winner: resulutDeclaration));
      // Navigator.of(context).push(MaterialPageRoute(
      //     builder: (context) => RedxScreen(
      //           // displayXo: resulutDeclaration,
      //           winner: resulutDeclaration,
      //         )));
      // });
    }
    if (winnerFound && filledBoxes == 9) {
      // setState(() {
      resulutDeclaration = 'Nobody Wins!';
      // });
      update();
    }
  }

  void _updateScore(String winner) {
    if (winner == 'o') {
      oScore++;
      controllerCenter.play();
    } else if (winner == 'x') {
      xScore++;
      controllerCenter.play();
    }
    winnerFound = true;
  }

  Text display(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.white, fontSize: 20),
    );
  }
}
