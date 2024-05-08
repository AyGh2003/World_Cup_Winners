import 'package:flutter/material.dart';
import 'info.dart';

class WorldCupDropdown extends StatefulWidget {
  final ValueChanged<String?> onChanged;

  const WorldCupDropdown({Key? key, required this.onChanged}) : super(key: key);

  @override
  _WorldCupDropdownState createState() => _WorldCupDropdownState();
}

class _WorldCupDropdownState extends State<WorldCupDropdown> {
  String? selectedEdition;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 55, 46, 186),
      child: Container(
        width: 300,
        child: Center(
          child: FutureBuilder<List<Map<String, dynamic>>>(
            future: fetchWorldCupResults(),
            builder: (BuildContext context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData) {
                List<Map<String, dynamic>> worldCupEditions = snapshot.data!;
                return StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                    return DropdownButton<String>(
                      hint: Text(
                        'Select World Cup Edition',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 252, 252, 252),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      value: selectedEdition,
                      dropdownColor: Color.fromARGB(255, 55, 46, 186),
                      iconEnabledColor: Color.fromARGB(255, 252, 252, 252),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedEdition = newValue;
                          widget.onChanged(newValue); 
                        });
                      },
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      items: worldCupEditions.map((edition) {
                        return DropdownMenuItem<String>(
                          value: edition['World_cup_edition'].toString(),
                          child: Text(
                            'World Cup '+ edition['World_cup_edition'].toString(),
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      }).toList(),
                      underline: Container(),
                    );
                  },
                );
              } else {
                return Text('No data available');
              }
            },
          ),
        ),
      ),
    );
  }
}
