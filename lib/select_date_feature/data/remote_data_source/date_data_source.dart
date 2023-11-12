import 'package:go_hotels/global/errors/failures.dart';

class DateRangeDataProvider {
  Future<Either<Failure, DateTime?>> pickDate(DateTime initialDate) async {
    // Implement date picking logic here
    return Future.delayed(const Duration(seconds: 1), () => DateTime.now());
  }
}
