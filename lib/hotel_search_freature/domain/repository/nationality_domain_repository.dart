import 'package:dartz/dartz.dart';

import '../../../global/errors/failures.dart';

abstract class NationalityRepository {
  Future<Either<Failure, List<String>>> fetchNationalities();
}
