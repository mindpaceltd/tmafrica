// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<dynamic>> search(String? searchTerm) async {
  if (searchTerm == null || searchTerm.isEmpty) {
    return [];
  }

  final response =
      await http.get(Uri.parse('https://tmafrica.co.ug/jsonapi/node/n'));

  if (response.statusCode != 200) {
    throw Exception('Failed to load data');
  }

  final data = json.decode(response.body);

  final titles = (data['data'] as List)
      .where((item) => item['attributes']['title']
          .toString()
          .toLowerCase()
          .contains(searchTerm.toLowerCase()))
      .toList();

  return titles;
}
