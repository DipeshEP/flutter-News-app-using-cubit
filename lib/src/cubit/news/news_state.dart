part of 'news_cubit.dart';

abstract class NewsState extends Equatable{
 const NewsState();
}

class NewsInitial extends NewsState {

  @override
  List<Object> get props => [];
}

class NewsLoading extends NewsState{

  @override
  List<Object> get props => [];
}
class NewsLoaded extends NewsState{
 final List <Articles> data;
 const NewsLoaded(this.data);
 @override
  List <Object>get props=>[data];


}
class NewsLoadError extends NewsState{
  @override
  List<Object> get props => [];
}