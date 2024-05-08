import 'package:flutter/material.dart';

class addWCPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Add new World Cup'),
        backgroundColor: Color.fromARGB(255, 55, 46, 186),
      ),
      body: Center(
        child: SafeArea(
          child: Card(
            color: Color.fromRGBO(177, 216, 255, 1),
            child: Container(
              width: 340,
              height: 410,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Card(
                            margin: EdgeInsetsDirectional.only(top: 8, bottom: 8, start: 5),
                            color: Color.fromARGB(255, 55, 46, 186),
                            child: Container(
                              width: 200,
                              height: 65,
                              child: Center(
                                child: Text(
                                  'World cup edition :',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Card(
                            margin: EdgeInsetsDirectional.only(top: 8, bottom: 8, start: 5),
                            color: Color.fromARGB(255, 55, 46, 186),
                            child: Container(
                              width: 200,
                              height: 65,
                              child: Center(
                                child: Text(
                                  'World cup Winner :',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Card(
                            margin: EdgeInsetsDirectional.only(top: 8, bottom: 8, start: 5),
                            color: Color.fromARGB(255, 55, 46, 186),
                            child: Container(
                              width: 200,
                              height: 65,
                              child: Center(
                                child: Text(
                                  'World cup Runner-up :',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Card(
                            margin: EdgeInsetsDirectional.only(top: 8, bottom: 8, start: 5),
                            color: Color.fromARGB(255, 55, 46, 186),
                            child: Container(
                              width: 200,
                              height: 65,
                              child: Center(
                                child: Text(
                                  'World cup Third :',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Add new textfield widget :

                          Container(
                            width: 120,
                            color: Colors.white,
                            margin: EdgeInsetsDirectional.only( start: 5),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Write here...',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),

                          // Add new text field widget :

                          Container(
                            width: 120,
                            color: Colors.white,
                            margin: EdgeInsetsDirectional.only(top: 22, start: 5),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Write here...',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),

                          // Add new text field widget :

                          Container(
                            width: 120,
                            color: Colors.white,
                            margin: EdgeInsetsDirectional.only(top: 22, start: 5),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Write here...',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),

                          // Add new text field widget:

                          Container(
                            width: 120,
                            color: Colors.white,
                            margin: EdgeInsetsDirectional.only(top: 22, start: 5),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Write here...',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // Add Submit button :
                  Container(
                    width: 160,
                    height: 60,
                    margin: EdgeInsets.all(5),
                    child: Card(
                      child: ListTile(
                        title: Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Center(
                            child: Text(
                              'Submit',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      color: Color.fromARGB(255, 255, 1, 1),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.indigoAccent,
    );
  }
}

