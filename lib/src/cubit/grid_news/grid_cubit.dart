import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:loginform/src/cubit/grid_news/grid_repository.dart';
import 'package:loginform/src/models/user.dart';

part 'grid_state.dart';

class GridCubit extends Cubit<GridState> {
  GridCubit() : super(GridInitial()) {
    getData();
  }
final random=Random();
  GridRepository repository = GridRepository();
  getData() async {
    emit(GridLoading());
    try {
      final response = await repository.fetchNews();
      List<Articles> data = response.articles!..shuffle();
     List limitedData=data.getRange(0, 4).toList();

      emit(GridLoaded(limitedData));
    } catch (ex) {
      emit(GridError());
    }
  }
}
