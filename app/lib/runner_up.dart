import 'package:flutter/material.dart';

class RunnerUpCard extends StatelessWidget {
  final String? runner_upName; 

  const RunnerUpCard({Key? key, required this.runner_upName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Padding(
          padding: const EdgeInsets.all(5),
          child: Text(
            '2 -',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            '${runner_upName ?? 'N/A'}',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
      ),
      color: Color.fromRGBO(154, 154, 148, 1),
    );
  }
}

