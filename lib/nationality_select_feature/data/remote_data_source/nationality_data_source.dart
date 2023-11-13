import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import '../../../global/errors/failures.dart';

class NationalityDataProvider {
  Future<Either<Failure, List<String>>> fetchNationalities() async {
    try {
      final response = await http.get(
        Uri.parse('https://restcountries.com/v3.1/all'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);

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
    } catch (error) {
      // Handle errors or exceptions here
      return left(const ServerFailure('An error occurred during the request'));
    }
  }
}
