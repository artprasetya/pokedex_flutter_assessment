import 'package:flutter/material.dart';
import 'package:pokedex_flutter_assessment/pokedex/domain/entities/pokemon_entity.dart';

class PokemonCardItem extends StatelessWidget {
  final int index;
  final PokemonEntity? pokemon;
  final Function(BuildContext, PokemonEntity?) onTapPokemon;

  const PokemonCardItem({
    Key? key,
    this.index = 0,
    this.pokemon,
    required this.onTapPokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        onTap: () => onTapPokemon(context, pokemon),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                pokemon?.image ?? '',
                height: 100,
                fit: BoxFit.fitHeight,
              ),
              const SizedBox(height: 8),
              Text(pokemon?.name ?? ''),
            ],
          ),
        ),
      ),
    );
  }
}
