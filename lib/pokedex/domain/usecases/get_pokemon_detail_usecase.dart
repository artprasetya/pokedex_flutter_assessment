import 'package:pokedex_flutter_assessment/pokedex/domain/entities/pokemon_entity.dart';
import 'package:pokedex_flutter_assessment/pokedex/domain/repositories/pokedex_repository.dart';

class GetPokemonDetailUsecase {
  final PokedexRepository repository;

  GetPokemonDetailUsecase(this.repository);

  Future<PokemonEntity?> call({required String id, required String name}) =>
      repository.getPokemon(id: id, name: name);
}
