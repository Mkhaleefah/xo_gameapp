import 'package:flutter/material.dart';
import 'package:gameee/redx_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    setState(() {
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
    });
  }

  int oScore = 0;
  int xScore = 0;
  int filledBoxes = 0;
  String resulutDeclaration = '';
  bool winnerFound = false;
  static var customFontWhite = GoogleFonts.coiny(
      textStyle: TextStyle(
    color: Colors.white,
    letterSpacing: 3,
    fontSize: 28,
  ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text('TIC TAK'),
      ),
      body: Padding(
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
                        xScore.toString(),
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
                        oScore.toString(),
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
                          _tapped(index);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              displayXo[index],
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
                onPressed: clearboard,
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
      ),
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
  void _tapped(int index) {
    setState(() {
      if (displayXo[index] == '') {
        if (!oTurn) {
          displayXo[index] = 'x';
          // filledBoxes++;
        } else {
          displayXo[index] = 'o';
          // filledBoxes++;
        }
        filledBoxes++;
        oTurn = !oTurn;
        _checkwinner();
      }
    });
  }

  void _checkwinner() {
    //check 1row
    if (displayXo[0] == displayXo[1] &&
        displayXo[0] == displayXo[2] &&
        displayXo[0] != '') {
      setState(() {
        _updateScore(displayXo[0]);
        resulutDeclaration = 'Player' + displayXo[0] + 'Wins!';
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => RedxScreen(
                  // displayXo: resulutDeclaration,
                  winner: resulutDeclaration,
                )));
      });
    }
    //check 2row
    if (displayXo[3] == displayXo[4] &&
        displayXo[3] == displayXo[5] &&
        displayXo[3] != '') {
      setState(() {
        _updateScore(displayXo[3]);
        resulutDeclaration = 'Player' + displayXo[3] + 'Wins!';
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => RedxScreen(
                  // displayXo: resulutDeclaration,
                  winner: resulutDeclaration,
                )));
      });
    }
    //check 3row
    if (displayXo[6] == displayXo[7] &&
        displayXo[6] == displayXo[8] &&
        displayXo[6] != '') {
      setState(() {
        _updateScore(displayXo[6]);
        resulutDeclaration = 'Player' + displayXo[6] + 'Wins!';
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => RedxScreen(
                  // displayXo: resulutDeclaration,
                  winner: resulutDeclaration,
                )));
      });
    }
    //check 1column
    if (displayXo[0] == displayXo[3] &&
        displayXo[0] == displayXo[6] &&
        displayXo[0] != '') {
      setState(() {
        _updateScore(displayXo[0]);
        resulutDeclaration = 'Player' + displayXo[0] + 'Wins!';
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => RedxScreen(
                  // displayXo: resulutDeclaration,
                  winner: resulutDeclaration,
                )));
      });
    }
    //check 2column
    if (displayXo[1] == displayXo[4] &&
        displayXo[1] == displayXo[7] &&
        displayXo[1] != '') {
      setState(() {
        _updateScore(displayXo[1]);
        resulutDeclaration = 'Player' + displayXo[1] + 'Wins!';
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => RedxScreen(
                  // displayXo: resulutDeclaration,
                  winner: resulutDeclaration,
                )));
      });
    }
    //check 3column
    if (displayXo[2] == displayXo[5] &&
        displayXo[2] == displayXo[8] &&
        displayXo[2] != '') {
      setState(() {
        _updateScore(displayXo[2]);
        resulutDeclaration = 'Player' + displayXo[2] + 'Wins!';
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => RedxScreen(
                  // displayXo: resulutDeclaration,
                  winner: resulutDeclaration,
                )));
      });
    }
    //check dignal
    if (displayXo[0] == displayXo[4] &&
        displayXo[0] == displayXo[8] &&
        displayXo[0] != '') {
      setState(() {
        _updateScore(displayXo[0]);
        resulutDeclaration = 'Player' + displayXo[0] + 'Wins!';
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => RedxScreen(
                  // displayXo: resulutDeclaration,
                  winner: resulutDeclaration,
                )));
      });
    }
    //check dignal
    if (displayXo[6] == displayXo[4] &&
        displayXo[6] == displayXo[2] &&
        displayXo[6] != '') {
      setState(() {
        _updateScore(displayXo[6]);
        resulutDeclaration = 'Player' + displayXo[6] + 'Wins!';
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => RedxScreen(
                  // displayXo: resulutDeclaration,
                  winner: resulutDeclaration,
                )));
      });
    }
    if (winnerFound && filledBoxes == 9) {
      setState(() {
        resulutDeclaration = 'Nobody Wins!';
      });
    }
  }

  void _updateScore(String winner) {
    if (winner == '0') {
      oScore++;
    } else if (winner == 'x') {
      xScore++;
    }
    winnerFound = true;
  }
}
