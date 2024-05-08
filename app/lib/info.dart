import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String?> fetchWinnerName(String? edition) async {
  if (edition == null || edition.isEmpty) {
    return null;
  }

  final response =
      await http.get(Uri.parse('http://192.168.1.3:8000/world_cup'));

  if (response.statusCode == 200) {
    final List<dynamic> jsonResponse = json.decode(response.body);
    final Map<String, dynamic>? result = jsonResponse.firstWhere(
      (result) => result['World_cup_edition'].toString() == edition,
      orElse: () => null,
    );

    return result != null ? result['Winner'] : null;
  } else {
    throw Exception('Failed to fetch World Cup results');
  }
}

Future<List<Map<String, dynamic>>> fetchWorldCupResults() async {
  final response =
      await http.get(Uri.parse('http://192.168.1.3:8000/world_cup'));

  if (response.statusCode == 200) {
    final List<dynamic> jsonResponse = json.decode(response.body);
    final List<Map<String, dynamic>> results = [];

    for (dynamic result in jsonResponse) {
      results.add(Map<String, dynamic>.from(result));
    }

    return results;
  } else {
    throw Exception('Failed to fetch World Cup results');
  }
}

Future<String?> fetchrunner_upName(String? edition) async {
  if (edition == null || edition.isEmpty) {
    return null;
  }

  final response =
      await http.get(Uri.parse('http://192.168.1.3:8000/world_cup'));

  if (response.statusCode == 200) {
    final List<dynamic> jsonResponse = json.decode(response.body);
    final Map<String, dynamic>? result = jsonResponse.firstWhere(
      (result) => result['World_cup_edition'].toString() == edition,
      orElse: () => null,
    );

    return result != null ? result['Runner_up'] : null;
  } else {
    throw Exception('Failed to fetch World Cup results');
  }
}

Future<String?> fetchThirdName(String? edition) async {
  if (edition == null || edition.isEmpty) {
    return null;
  }

  final response =
      await http.get(Uri.parse('http://192.168.1.3:8000/world_cup'));

  if (response.statusCode == 200) {
    final List<dynamic> jsonResponse = json.decode(response.body);
    final Map<String, dynamic>? result = jsonResponse.firstWhere(
      (result) => result['World_cup_edition'].toString() == edition,
      orElse: () => null,
    );

    return result != null ? result['Third_place'] : null;
  } else {
    throw Exception('Failed to fetch World Cup results');
  }
}

// Main function to execute fetch functions
void main() async {
  try {
    // Execute the fetch functions
    String? winner =
        await fetchWinnerName('1998'); // Provide the desired edition here
    String? runnerUp =
        await fetchrunner_upName('1998'); // Provide the desired edition here
    String? thirdPlace =
        await fetchThirdName('1998'); // Provide the desired edition here
    List<Map<String, dynamic>> results = await fetchWorldCupResults();

    // Print the results to the console
    print('Winner: $winner');
    print('Runner Up: $runnerUp');
    print('Third Place: $thirdPlace');
    print('All World Cup Results:');
    for (var result in results) {
      print(result);
    }
  } catch (e) {
    print('Error occurred: $e');
  }
}
