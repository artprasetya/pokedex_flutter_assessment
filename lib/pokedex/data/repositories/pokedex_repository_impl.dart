import 'package:pokedex_flutter_assessment/pokedex/data/models/pokemon_model.dart';
import 'package:pokedex_flutter_assessment/pokedex/domain/entities/pokemon_entity.dart';
import 'package:pokedex_flutter_assessment/pokedex/domain/repositories/pokedex_repository.dart';
import 'package:pokedex_flutter_assessment/services/gql_service.dart';

class PokedexRepositoryImpl implements PokedexRepository {
  final GraphQLService _graphQLService;

  PokedexRepositoryImpl(this._graphQLService);

  @override
  Future<PokemonEntity?> getPokemon({
    required String id,
    required String name,
  }) {
    const query = r"""
     query getPokemon($id: String!, $name: String!) {
      pokemon(id: $id, name: $name) {
        id
        number
        name
        types
        image
        classification
        maxHP
        maxCP
        evolutions {
          id
          number
          name
          image
        }
        attacks {
          fast {
            name
            type
            damage
          }
          special {
            name
            type
            damage
          }
        }
      }
    }
    """;

    return _graphQLService
        .query(query, variables: {"id": id, "name": name})
        .then(
          (data) =>
              data['pokemon'] != null
                  ? PokemonModel.fromJson(data['pokemon']).toEntity()
                  : null,
        );
  }

  @override
  Future<List<PokemonEntity>> getPokemons(int first) async {
    const query = r"""
      query getPokemons($first: Int!) {
        pokemons(first: $first) {
          id
          name
          image
        }
      }
    """;

    final data = await _graphQLService.query(
      query,
      variables: {"first": first},
    );

    final pokemons = data['pokemons'] as List<dynamic>;

    return pokemons
        .map((pokemon) => PokemonModel.fromJson(pokemon).toEntity())
        .toList();
  }
}
