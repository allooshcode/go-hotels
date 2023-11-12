import 'package:dartz/dartz.dart';
import 'package:go_hotels/global/errors/failures.dart';
import 'package:go_hotels/hotel_search_freature/data/remote_data_source/nationality_data_source.dart';
import 'package:go_hotels/hotel_search_freature/domain/repository/nationality_domain_repository.dart';

class NationalityDataRepository implements NationalityRepository {
  final NationalityDataProvider nationalityDataProvider;

  NationalityDataRepository({required this.nationalityDataProvider});

  @override
  Future<Either<Failure, List<String>>> fetchNationalities() {
    return nationalityDataProvider.fetchNationalities();
  }
}
