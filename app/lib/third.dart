import 'package:flutter/material.dart';

class ThirdCard extends StatelessWidget {
  final String? thirdName; 

  const ThirdCard({Key? key, required this.thirdName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Padding(
          padding: const EdgeInsets.all(5),
          child: Text(
            '3 -',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            '${thirdName ?? 'N/A'}', 
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
      ),
      color: Color.fromRGBO(171, 93, 25, 1),
    );
  }
}

