import 'package:equatable/equatable.dart';

abstract class DogsBlocEvent extends Equatable {
  const DogsBlocEvent();
}

class DogsLoadBreeds extends DogsBlocEvent {
  @override
  List<Object> get props => [];
}

class DogsLoadMoreBreeds extends DogsBlocEvent {
  @override
  List<Object> get props => [];
}