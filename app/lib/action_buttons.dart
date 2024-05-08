
import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  final VoidCallback onSignInPressed;
  final VoidCallback onAddNewWCPressed;

  const ActionButtons({required this.onSignInPressed,required this.onAddNewWCPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 160,
          height: 70,
          margin: EdgeInsets.all(5),
          child: Card(
            child: ListTile(
              title: Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Center(
                  child: Text(
                    'Delate Edition',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              onTap: onSignInPressed, // Call the provided function for navigation
            ),
            color: Color.fromARGB(255, 55, 46, 186),
          ),
        ),
        Container(
          width: 160,
          height: 70,
          margin: EdgeInsets.all(5),
          child: Card(
            child: ListTile(
              title: Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Center(
                  child: Text(
                    'Add Edition',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              onTap: onAddNewWCPressed,
            ),
            color: Color.fromARGB(255, 55, 46, 186),
          ),
        ),
      ],
    );
  }
}
