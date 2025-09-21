import 'package:flutter/material.dart';
import 'package:pokedex_flutter_assessment/pokedex/data/models/pokemon_model.dart';
import 'package:pokedex_flutter_assessment/pokedex/domain/entities/pokemon_entity.dart';

class PokemonDetailContent extends StatelessWidget {
  final PokemonEntity? pokemon;

  const PokemonDetailContent({Key? key, this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (pokemon == null) {
      return const Center(child: Text("No Pokémon data available"));
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (pokemon!.image?.isNotEmpty == true) ...[
            Image.network(pokemon!.image!, height: 200, fit: BoxFit.fitHeight),
            const SizedBox(height: 16),
          ],

          if (pokemon?.types?.isNotEmpty == true)
            _PokemonTypes(types: pokemon?.types ?? []),
          if (pokemon?.attacks != null)
            _PokemonAttacks(attacks: pokemon?.attacks),
          if (pokemon?.evolutions?.isNotEmpty == true)
            _PokemonEvolutions(evolutions: pokemon?.evolutions ?? []),

          const SizedBox(height: kToolbarHeight),
        ],
      ),
    );
  }
}

class _PokemonTypes extends StatelessWidget {
  final List<String> types;

  const _PokemonTypes({required this.types});

  @override
  Widget build(BuildContext context) {
    return _Section(
      title: "Types",
      child: Wrap(
        spacing: 12,
        children:
            types
                .map(
                  (t) => Chip(
                    label: Text(
                      t,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                )
                .toList(),
      ),
    );
  }
}

class _PokemonAttacks extends StatelessWidget {
  final Attacks? attacks;

  const _PokemonAttacks({this.attacks});

  @override
  Widget build(BuildContext context) {
    return _Section(
      title: "Attacks",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _AttackList(
            title: "Fast Attacks",
            icon: Icons.flash_on,
            color: Colors.orange,
            items: attacks?.fast ?? [],
          ),
          const SizedBox(height: 16),
          _AttackList(
            title: "Special Attacks",
            icon: Icons.star,
            color: Colors.redAccent,
            items: attacks?.special ?? [],
          ),
        ],
      ),
    );
  }
}

class _AttackList extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final List<Fast> items;

  const _AttackList({
    required this.title,
    required this.icon,
    required this.color,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(height: 8),
        ...items.map(
          (a) => ListTile(
            dense: true,
            leading: Icon(icon, color: color),
            title: Text(a.name ?? ''),
            subtitle: Text("Type: ${a.type}"),
            trailing: Text("DMG: ${a.damage}"),
          ),
        ),
      ],
    );
  }
}

class _PokemonEvolutions extends StatelessWidget {
  final List<Evolution> evolutions;

  const _PokemonEvolutions({required this.evolutions});

  @override
  Widget build(BuildContext context) {
    return _Section(
      title: "Evolutions",
      child: Wrap(
        spacing: 12,
        children:
            evolutions
                .map(
                  (e) => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (e.image?.isNotEmpty == true)
                        Image.network(e.image!, width: 80, height: 80),
                      Text(e.name ?? ''),
                    ],
                  ),
                )
                .toList(),
      ),
    );
  }
}

class _Section extends StatelessWidget {
  final String title;
  final Widget child;

  const _Section({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          child,
        ],
      ),
    );
  }
}
