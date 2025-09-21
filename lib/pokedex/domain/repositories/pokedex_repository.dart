import 'package:pokedex_flutter_assessment/pokedex/domain/entities/pokemon_entity.dart';

abstract class PokedexRepository {
  Future<List<PokemonEntity>> getPokemons(int first);
  Future<PokemonEntity?> getPokemon({required String id, required String name});
}
