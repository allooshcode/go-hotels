import 'package:dartz/dartz.dart';
import 'package:go_hotels/global/errors/failures.dart';
import 'package:go_hotels/hotel_search_freature/data/remote_data_source/nationality_data_source.dart';
import 'package:go_hotels/hotel_search_freature/domain/repository/nationality_domain_repository.dart';
import 'package:go_hotels/hotel_search_freature/presentation/pages/testPage.dart';
import 'package:go_hotels/select_date_feature/data/remote_data_source/date_data_source.dart';

import '../../domain/repository/date_range_repository.dart';

class DateRangeDataRepository implements DateRangeRepository {
  final DateRangeDataProvider dateRangeDataProvider;

  DateRangeDataRepository({required this.dateRangeDataProvider});

  @override
  Future<Either<Failure, DateTime>> pickDate() {
    return dateRangeDataProvider.pickDate(initialDate);
  }
}
