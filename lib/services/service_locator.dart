import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex_flutter_assessment/pokedex/data/repositories/pokedex_repository_impl.dart';
import 'package:pokedex_flutter_assessment/pokedex/domain/repositories/pokedex_repository.dart';
import 'package:pokedex_flutter_assessment/pokedex/domain/usecases/get_pokemon_detail_usecase.dart';
import 'package:pokedex_flutter_assessment/pokedex/domain/usecases/get_pokemon_list_usecase.dart';
import 'package:pokedex_flutter_assessment/pokedex/presentation/bloc/pokedex_detail/pokedex_detail_bloc.dart';
import 'package:pokedex_flutter_assessment/pokedex/presentation/bloc/pokedex_list/pokedex_bloc.dart';
import 'package:pokedex_flutter_assessment/services/gql_service.dart';

GetIt getIt = GetIt.I;

Future<void> setupServiceLocator() async {
  getIt
    // Services
    ..registerLazySingleton<Dio>(Dio.new)
    ..registerLazySingleton<GraphQLService>(() => GraphQLService(getIt<Dio>()))
    // Repositories
    ..registerLazySingleton<PokedexRepository>(
      () => PokedexRepositoryImpl(getIt<GraphQLService>()),
    )
    // Usecases
    ..registerLazySingleton<GetPokemonListUsecase>(
      () => GetPokemonListUsecase(getIt<PokedexRepository>()),
    )
    ..registerLazySingleton<GetPokemonDetailUsecase>(
      () => GetPokemonDetailUsecase(getIt<PokedexRepository>()),
    )
    // Bloc
    ..registerFactory<PokedexBloc>(
      () => PokedexBloc(getIt<GetPokemonListUsecase>()),
    )
    ..registerFactory<PokedexDetailBloc>(
      () => PokedexDetailBloc(getIt<GetPokemonDetailUsecase>()),
    );
}
