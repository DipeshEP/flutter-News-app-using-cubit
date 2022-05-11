import 'package:bloc/bloc.dart';
import 'package:loginform/src/cubit/news/news_repository.dart';
import 'package:loginform/src/models/user.dart';
import 'package:equatable/equatable.dart';
part 'news_state.dart';
class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial()) {
    getData();
  }

  final NewsRepository repository = NewsRepository();

  void getData() async {
    try {
      emit(NewsLoading());
      final response = await repository.fetchNews();
      List<Articles>data = response.articles!;
      emit(NewsLoaded(data));
    }
    catch (ex) {
      emit(NewsLoadError());
    }
  }


  }


