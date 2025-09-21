import 'package:flutter/widgets.dart';
import 'package:pokedex_flutter_assessment/pokedex/domain/entities/pokemon_entity.dart';
import 'package:pokedex_flutter_assessment/pokedex/presentation/pages/list/widgets/pokemon_card_item.dart';

class PokemonGrid extends StatelessWidget {
  final ScrollController controller;
  final List<PokemonEntity>? pokemonList;
  final Function(BuildContext, PokemonEntity?) onTapItem;

  const PokemonGrid({
    Key? key,
    required this.controller,
    this.pokemonList = const [],
    required this.onTapItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GridView.builder(
          controller: controller,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemCount: pokemonList?.length,
          itemBuilder:
              (context, index) => PokemonCardItem(
                index: index,
                pokemon: pokemonList?[index],
                onTapPokemon: onTapItem,
              ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: constraints.maxWidth > 700 ? 4 : 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
        );
      },
    );
  }
}
