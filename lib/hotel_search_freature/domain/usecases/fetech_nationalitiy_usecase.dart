import 'package:dartz/dartz.dart';
import 'package:go_hotels/hotel_search_freature/domain/repository/nationality_domain_repository.dart';

import '../../../global/errors/failures.dart';

class FetchNationalityUseCase {
  final NationalityRepository nationalityRepository;

  FetchNationalityUseCase({required this.nationalityRepository});

  Future<Either<Failure, List<String>>> execute() {
    return nationalityRepository.fetchNationalities();
  }
}
