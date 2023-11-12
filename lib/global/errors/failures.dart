import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String msgError;
  const Failure(this.msgError);
}

class ServerFailure extends Failure {
  const ServerFailure(super.msgError);
  @override
  List<Object?> get props => throw UnimplementedError();
}
