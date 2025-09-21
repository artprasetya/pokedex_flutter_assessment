import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_flutter_assessment/pokedex/domain/entities/pokemon_entity.dart';
import 'package:pokedex_flutter_assessment/pokedex/presentation/bloc/pokedex_list/pokedex_bloc.dart';
import 'package:pokedex_flutter_assessment/pokedex/presentation/pages/detail/pokemon_detail_page.dart';
import 'package:pokedex_flutter_assessment/pokedex/presentation/pages/list/widgets/pokemon_grid.dart';

class PokemonListPage extends StatefulWidget {
  const PokemonListPage({super.key});

  @override
  State<PokemonListPage> createState() => _PokemonListPageState();
}

class _PokemonListPageState extends State<PokemonListPage> {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PokedexBloc>().add(GetPokemonListEvent());
      _controller.addListener(_onScroll);
    });
    super.initState();
  }

  void _onScroll() {
    if (_controller.position.pixels >=
        _controller.position.maxScrollExtent - 200) {
      context.read<PokedexBloc>().add(LoadMorePokemonsEvent());
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh:
            () async => context.read<PokedexBloc>().add(GetPokemonListEvent()),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: kToolbarHeight),
              // Title
              Text(
                'PokeDex',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16),

              // Pokemons
              BlocConsumer<PokedexBloc, PokedexState>(
                listener: (context, state) {
                  if (state.error?.isNotEmpty == true) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(state.error ?? '')));
                  }
                },
                builder: (context, state) {
                  return Expanded(
                    child:
                        state.isLoading
                            ? const Center(child: CircularProgressIndicator())
                            : PokemonGrid(
                              controller: _controller,
                              pokemonList: state.pokemons,
                              onTapItem:
                                  (context, pokemon) =>
                                      _navigateToDetailPage(context, pokemon),
                            ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToDetailPage(BuildContext context, PokemonEntity? pokemon) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PokemonDetailPage(pokemon: pokemon),
      ),
    );
  }
}
