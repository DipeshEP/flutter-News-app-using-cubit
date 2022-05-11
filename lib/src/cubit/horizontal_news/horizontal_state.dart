part of 'horizontal_cubit.dart';

abstract class HorizontalState extends Equatable {
  const HorizontalState();
}

class HorizontalInitial extends HorizontalState {
  @override
  List<Object> get props => [];
}
class HorizontalLoading extends HorizontalState {
  @override
  List<Object> get props => [];
}
class HorizontalLoaded extends HorizontalState {
  List <Articles> data;
  HorizontalLoaded(this.data);
  @override
  List<Object> get props => [data];
}
class HorizontalError extends HorizontalState {
  @override
  List<Object> get props => [];
}
