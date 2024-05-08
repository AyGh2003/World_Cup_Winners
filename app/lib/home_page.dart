
import 'package:flutter/material.dart';
import 'SignInPage.dart'; 
//import 'addWC.dart';
import 'world_cup_dropdown.dart';
import 'action_buttons.dart';
import 'winner.dart';
import 'runner_up.dart';
import 'third.dart';
import 'info.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedEdition;

  late Future<String?> winnerFuture = Future.value(null);
  late Future<String?> runner_upFuture = Future.value(null);
  late Future<String?> thirdFuture = Future.value(null);

  @override
  void initState() {
    super.initState();
    if (selectedEdition != null) {
      winnerFuture = fetchWinnerName(selectedEdition!);
      runner_upFuture = fetchrunner_upName(selectedEdition!);
      thirdFuture = fetchThirdName(selectedEdition!);
    }
  }

  // Function to navigate to some pages :
  void _navigateToSignInPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignInPage()),
    );
  }
/*
  void _navigateToaddWCPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => addWCPage()),
    );
  }
*/
// 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(177, 216, 255, 1),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
                color: Color.fromARGB(255, 55, 46, 186),
                margin: EdgeInsets.all(10),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Every FIFA World Cup Podium",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            Card(
              color: Color.fromARGB(255, 122, 199, 238),
              margin: EdgeInsets.all(10),
              child: Center(
                child: Column(
                  children: [
                    Container(
                      child: Center(
                        child: Text(
                          'Choose a World Cup Edition:',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(1, 5, 89, 1),
                          ),
                        ),
                      ),
                      height: 50,
                    ),
                    WorldCupDropdown(
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedEdition = newValue!;
                          winnerFuture = fetchWinnerName(selectedEdition);
                          runner_upFuture = fetchrunner_upName(selectedEdition);
                          thirdFuture = fetchThirdName(selectedEdition);
                        });
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 250,
                      height: 5.0,
                      child: Divider(
                        color: Color.fromRGBO(236, 239, 236, 0.788),
                      ),
                    ),
                    Container(
                      height: 130,
                      width: 220,
                      child: Image(
                        image: AssetImage("images/Podium.webp"),
                      ),
                    ),
                    Builder(
                      builder: (BuildContext context) {
                        return FutureBuilder<List<String?>>(
                          future: Future.wait([
                            winnerFuture,
                            runner_upFuture,
                            thirdFuture
                          ]),
                          builder: (BuildContext context,
                              AsyncSnapshot<List<String?>> snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return CircularProgressIndicator();
                            } else if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else if (snapshot.hasData) {
                              final List<String?> data = snapshot.data!;
                              final String? winner = data[0];
                              final String? runner_up = data[1];
                              final String? third = data[2];
                              List<Widget> podiumCards = [];
                              if (winner != null) {
                                podiumCards.add(WinnerCard(winnerName: winner));
                                podiumCards.add(RunnerUpCard(
                                    runner_upName:
                                    runner_up));
                                podiumCards.add(ThirdCard(thirdName: third));
                              }
                              return Column(
                                children: podiumCards,
                              );
                            } else {
                              return Text('World Cup Podium');
                            }
                          },
                        );
                      },
                    ),
                    SizedBox(
                      width: 250,
                      height: 25.0,
                      child: Divider(
                        color: Color.fromRGBO(236, 239, 236, 0.788),
                      ),
                    ),
                    Container(
                      height: 20,
                      child: Center(
                        child: Text(
                          'Modify the List of World Cup Editions :',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(1, 5, 89, 1),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    ActionButtons(
                      onSignInPressed: _navigateToSignInPage,
                      onAddNewWCPressed:  _navigateToSignInPage,
                      ),
                    SizedBox(
                      height: 5,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
