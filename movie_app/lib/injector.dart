import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/models/api/movie_api.dart';
import 'package:movie_app/models/api/movie_api_impl.dart';
import 'package:movie_app/providers/movie_detail_provider.dart';
import 'package:movie_app/providers/movie_discover_provider.dart';
import 'package:movie_app/providers/movie_top_rated_provider.dart';

import 'constants.dart';

// sl(service locator)
final sl = GetIt.instance;

void setup() {
  // Register provider
  sl.registerFactory<MovieDiscoverProvider>(
    () => MovieDiscoverProvider(sl()),
  );
  sl.registerFactory<MovieTopRatedProvider>(
    () => MovieTopRatedProvider(sl()),
  );
  sl.registerFactory<MovieDetailProvider>(
    () => MovieDetailProvider(sl()),
  );

  // Register Repository
  sl.registerLazySingleton<MovieRepository>(() => MovieImplRepository(sl()));

  // Register Http Client (Dio)
  sl.registerLazySingleton<Dio>(
    () => Dio(
      BaseOptions(
        baseUrl: Constants.baseUrl,
        queryParameters: {'api_key': Constants.apiKey},
      ),
    ),
  );
}