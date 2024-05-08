import 'package:flutter/material.dart';
class WinnerCard extends StatelessWidget {
  final String winnerName;

  const WinnerCard({Key? key, required this.winnerName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Padding(
          padding: const EdgeInsets.all(5),
          child: Text(
            '1 -',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            '${winnerName }',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
      ),
      color: Color.fromRGBO(255, 247, 2, 1),
    );
  }
}
