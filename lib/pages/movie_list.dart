import 'package:flutter/material.dart';
import 'package:praktikum7/service/http_service.dart';
import 'package:praktikum7/pages/movie_detail.dart';
//2031710159 Dikhi Achmad Dani

class MovieList extends StatefulWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  late int moviesCount;
  late List movies;
  late HttpService service;

  Future initialize() async {
    movies = [];
    movies = (await service.getPopularMovies())!;
    setState(() {
      moviesCount = movies.length;
      movies = movies;
    });
  }

  @override
  void initState() {
    service = HttpService();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Popular Movies \nDikhi Achmad Dani 2031710159"),
      ),
      body: ListView.builder(
          itemCount: (moviesCount == null) ? 0 : moviesCount,
          itemBuilder: (context, int position) {
            return Card(
              color: Colors.white,
              elevation: 2.0,
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  child: Image.network(
                    "https://image.tmdb.org/t/p/w500/" +
                        movies[position].posterPath,
                  ),
                ),
                title: Text(movies[position].title),
                subtitle:
                    Text('Rating = ' + movies[position].voteAverage.toString()),
                onTap: () {
                  MaterialPageRoute route = MaterialPageRoute(
                      builder: (_) => MovieDetail(movies[position]));
                  Navigator.push(context, route);
                },
              ),
            );
          }),
    );
  }
}
