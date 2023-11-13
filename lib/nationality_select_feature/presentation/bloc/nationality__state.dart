part of 'nationality__bloc.dart';

abstract class NationalityState extends Equatable {
  const NationalityState();
}

class NationalityInitial extends NationalityState {
  @override
  List<Object> get props => [];
}

class LoadedNationalitiesState extends NationalityState {
  final List<String> nationalities;

  const LoadedNationalitiesState(this.nationalities);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class ErrorNationalityState extends NationalityState {
  final String error;

  const ErrorNationalityState(this.error);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
