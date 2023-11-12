import 'package:dartz/dartz.dart';

import '../../../global/errors/failures.dart';

abstract class DateRangeRepository {
  Future<Either<Failure, DateTime>> pickDate();
}
