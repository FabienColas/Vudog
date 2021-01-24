import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class DogsBlocState extends Equatable {
  const DogsBlocState();

  @override
  List<Object> get props => [];
}

class DogsSuccess extends DogsBlocState {
  final String success;

  const DogsSuccess({@required this.success});

  @override
  List<Object> get props => [success];
}

class DogsNoMoreData extends DogsBlocState {}

class DogsLoading extends DogsBlocState {}

class DogsLoaded extends DogsBlocState {}

class DogsStopLoading extends DogsBlocState {}

class DogsError extends DogsBlocState {
  final String error;

  const DogsError({@required this.error});

  @override
  List<Object> get props => [error];
}