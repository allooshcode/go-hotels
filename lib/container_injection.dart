import 'package:get_it/get_it.dart';
import 'package:go_hotels/hotel_search_freature/data/data_repository/nationality_data_repository.dart';
import 'package:go_hotels/hotel_search_freature/data/remote_data_source/nationality_data_source.dart';
import 'package:go_hotels/hotel_search_freature/domain/repository/nationality_domain_repository.dart';
import 'package:go_hotels/hotel_search_freature/domain/usecases/fetech_nationalitiy_usecase.dart';
import 'package:go_hotels/hotel_search_freature/presentation/bloc/nationality__bloc.dart';

final sl = GetIt.I;

Future initSl() async {
  //services

  //contorllers

  sl.registerLazySingleton<NationalityBloc>(() =>
      NationalityBloc(sl<FetchNationalityUseCase>())
        ..add(FetchNationalitiesEvent()));

  //usecases

  sl.registerLazySingleton(() => FetchNationalityUseCase(
      nationalityRepository: sl<NationalityRepository>()));

  //domain

  sl.registerLazySingleton<NationalityRepository>(() =>
      NationalityDataRepository(
          nationalityDataProvider: sl<NationalityDataProvider>()));

  //data
  sl.registerLazySingleton(() => NationalityDataProvider());
}
