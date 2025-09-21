import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_flutter_assessment/pokedex/domain/entities/pokemon_entity.dart';
import 'package:pokedex_flutter_assessment/pokedex/presentation/bloc/pokedex_detail/pokedex_detail_bloc.dart';
import 'package:pokedex_flutter_assessment/pokedex/presentation/pages/detail/widgets/pokemon_detail_content.dart';
import 'package:pokedex_flutter_assessment/services/service_locator.dart';

class PokemonDetailPage extends StatelessWidget {
  final PokemonEntity? pokemon;

  const PokemonDetailPage({Key? key, this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              getIt<PokedexDetailBloc>()..add(
                GetPokemonDetailEvent(
                  id: pokemon?.id ?? '',
                  name: pokemon?.name ?? '',
                ),
              ),
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: kToolbarHeight),

            // Button Back
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.chevron_left),
                  ),
                ],
              ),
            ),

            // Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                pokemon?.name ?? '',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Content
            Expanded(
              child: BlocConsumer<PokedexDetailBloc, PokedexDetailState>(
                listener: (context, state) {
                  if (state.error?.isNotEmpty == true) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(state.error ?? '')));
                  }
                },
                builder: (context, state) {
                  return state.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : PokemonDetailContent(pokemon: state.pokemon);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
