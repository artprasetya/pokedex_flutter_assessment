import 'package:pokedex_flutter_assessment/pokedex/domain/entities/pokemon_entity.dart';
import 'package:pokedex_flutter_assessment/pokedex/domain/repositories/pokedex_repository.dart';

class GetPokemonListUsecase {
  final PokedexRepository repository;

  GetPokemonListUsecase(this.repository);

  Future<List<PokemonEntity>> call(int first) => repository.getPokemons(first);
}
