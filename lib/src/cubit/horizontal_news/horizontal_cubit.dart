import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:loginform/src/cubit/horizontal_news/horizontal_repository.dart';
import 'package:loginform/src/models/user.dart';

part 'horizontal_state.dart';

class HorizontalCubit extends Cubit<HorizontalState> {
  HorizontalCubit() : super(HorizontalInitial()){
    getData();
  }
  HorizontalRepository repository=HorizontalRepository();
  getData()async{
    emit(HorizontalLoading());
    try {
      final response = await repository.fetNews();
      List<Articles> data = response.articles!;
      emit(HorizontalLoaded(data));
    }
    catch(ex){
      emit(HorizontalError());
    }
  }

}
