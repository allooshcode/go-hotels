// data_provider.dart
import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:go_hotels/global/errors/failures.dart';
import 'package:http/http.dart' as http;

class NationalityDataProvider {
  Future<Either<Failure, List<String>>> fetchNationalities() async {
    final response = await http.get(
      Uri.parse('https://restcountries.com/v3.1/all'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      debugPrint(data.toString());

      final List<String> nations = data
          .map<String>((country) {
            final List<dynamic> altSpellings = country['altSpellings'];
            return altSpellings.isNotEmpty
                ? country['name']['common']
                : altSpellings[0];
          })
          .where((nationality) => nationality.isNotEmpty)
          .toList();

      return right(nations);
    } else {
      return left(const ServerFailure('Failed to load nationalities'));
    }
  }
}
