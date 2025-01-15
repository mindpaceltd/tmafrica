// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// DO NOT REMOVE OR MODIFY THE CODE ABOVE

import 'package:http/http.dart' as http;
import 'dart:convert';

Future<dynamic> fetchNewsWithFilter(
  String? apiEndPoint,
  String? fieldnewstypesid,
) async {
  // Validate input parameters
  if (apiEndPoint == null || fieldnewstypesid == null) {
    throw Exception('API endpoint and field news types ID must not be null');
  }

  // Construct the full URL with query parameters
  final String fullUrl =
      '$apiEndPoint?filter[field_news_types.id]=$fieldnewstypesid&sort=-created';

  try {
    // Make the HTTP GET request
    final response = await http.get(Uri.parse(fullUrl));

    // Check if the request was successful
    if (response.statusCode == 200) {
      // Return the JSON response decoded
      return json.decode(response.body);
    } else {
      // Handle API error responses
      throw Exception('Failed to load news: ${response.statusCode}');
    }
  } catch (e) {
    // Handle any exceptions
    throw Exception('An error occurred: $e');
  }
}
