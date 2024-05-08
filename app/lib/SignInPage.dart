import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Sign In'),
        backgroundColor: Color.fromARGB(255, 55, 46, 186),
      ),
      body: SafeArea(
        child: Center(
          child: Card(
            color: Color.fromRGBO(177, 216, 255, 1),
            child: Container(
              width: 320,
              height: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    color: Color.fromARGB(255, 55, 46, 186),
                    child: Container(
                      width: 300,
                      height: 60,
                      child: Center(
                        child: Text(
                          'Username :',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),
                  ),
        
                  // Add new textfield widget :
                  
                  Container(
                    width: 250,
                    color: Colors.white,
                    margin: EdgeInsets.all(10),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter your username here...',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
        
                  Card(
                    color: Color.fromARGB(255, 55, 46, 186),
                    child: Container(
                      width: 300,
                      height: 60,
                      child: Center(
                        child: Text(
                          'Password :',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),
                  ),
                  
                  // Add new text field widget :
        
                  Container(
                    width: 250,
                    color: Colors.white,
                    margin: EdgeInsets.all(10),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter your password here...',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
        
                  // Add Submit button :
                  Container(
                    width: 160,
                    height: 58,
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
      backgroundColor: Colors.indigoAccent
    );
  }
}