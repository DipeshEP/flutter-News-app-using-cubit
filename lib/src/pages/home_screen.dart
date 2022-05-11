import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginform/src/cubit/grid_news/grid_cubit.dart';
import 'package:loginform/src/cubit/horizontal_news/horizontal_cubit.dart';
import 'package:loginform/src/cubit/news/news_cubit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shimmer/shimmer.dart';
import '../custom_ui/carousel_widget.dart';
import '../custom_ui/custom_gridview.dart';
import '../custom_ui/custom_listview.dart';
import '../custom_ui/custom_vertcal_listview.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _cubit = GridCubit();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Flutter ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "News",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            )
          ],
        ),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () {
          _cubit.getData();
          return Future.value();
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<NewsCubit, NewsState>(
                builder: (context, state) {
                  if (state is NewsLoading) {
                    return Center(
                      child: Shimmer.fromColors(
                          baseColor: Colors.grey.withOpacity(.45),
                          highlightColor: Colors.white.withOpacity(.15),
                          period: Duration(seconds: 3),
                          child: CarouselSlider.builder(
                              itemCount: 1,
                              itemBuilder: (context, index, realIndex) {
                                return Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5),
                                  child: Container(color: Colors.black,)
                                );
                              },
                              options: CarouselOptions(
                                height: 200,
                              ))),
                    );
                  } else if (state is NewsLoadError) {
                    return const Center(
                      child: Text("internal error"),
                    );
                  } else if (state is NewsLoaded) {
                    final result = state.data;
                    return CarouselSlider.builder(
                        itemCount: result.length,
                        itemBuilder: (context, index, realIndex) {
                          return CustomCarouselWidget(
                            bgimage: result[index].urlToImage ?? "",
                            arguments: result[index],
                          );
                        },
                        options: CarouselOptions(
                            height: 200,
                            autoPlay: true,
                            reverse: true,
                            autoPlayInterval: const Duration(seconds: 3)));
                  } else {
                    return Container();
                  }
                },
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8, top: 8),
                child: Text(
                  "Stories",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                  ),
                ),
              ),
              BlocBuilder(
                bloc: _cubit,
                builder: (context, state) {
                  if (state is GridLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is GridLoaded) {
                    final result = state.data;
                    return Container(
                        padding: const EdgeInsets.all(8),
                        height: 400,
                        child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 200,
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10,
                                    childAspectRatio: 2 / 2),
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: result.length,
                            itemBuilder: (context, index) {
                              return CustomGridView(
                                img: result[index].urlToImage ?? '',
                                arguments: result[index],
                              );
                            }));
                  } else if (state is HorizontalError) {
                    return const Center(child: Icon(Icons.error));
                  } else {
                    return Container();
                  }
                },
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8, top: 8),
                child: Text(
                  "Highlights",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                  ),
                ),
              ),
              BlocBuilder<HorizontalCubit, HorizontalState>(
                builder: (context, state) {
                  if (state is HorizontalLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is HorizontalLoaded) {
                    final result = state.data;
                    return SizedBox(
                        height: 200,
                        child: ListView.builder(
                            itemCount: result.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => CustomListView(
                                  img: result[index].urlToImage ?? "",
                                  title: result[index].title ?? '',
                                  arguments: result[index],
                                )));
                  } else if (state is HorizontalError) {
                    return const Center(child: Icon(Icons.error));
                  } else {
                    return Container();
                  }
                },
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8, top: 8),
                child: Text(
                  "Others",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                  ),
                ),
              ),
              BlocBuilder<NewsCubit, NewsState>(
                builder: (context, state) {
                  if (state is NewsLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is NewsLoaded) {
                    final result = state.data;
                    return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: result.length,
                        itemBuilder: (context, index) {
                          return CustomVerticalListView(
                            img: result[index].urlToImage ?? '',
                            title: result[index].title ?? '',
                            description: result[index].description ?? '',
                            arguments: result[index],
                          );
                        });
                  } else if (state is NewsLoadError) {
                    return const Center(child: Icon(Icons.error));
                  } else {
                    return Container();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
