import 'package:get_it/get_it.dart';
import 'package:go_hotels/nationality_select_feature/data/data_repository/nationality_data_repository.dart';
import 'package:go_hotels/nationality_select_feature/data/remote_data_source/nationality_data_source.dart';
import 'package:go_hotels/nationality_select_feature/domain/repository/nationality_domain_repository.dart';
import 'package:go_hotels/nationality_select_feature/domain/usecases/fetech_nationalitiy_usecase.dart';
import 'package:go_hotels/nationality_select_feature/presentation/bloc/nationality__bloc.dart';
import 'package:go_hotels/room_details_booking_feature/presentation/bloc/room_booking_bloc_bloc.dart';

final sl = GetIt.I;

Future initSl() async {
  //services

  //contorllers

  sl.registerLazySingleton(() => RoomBookingBloc());

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
