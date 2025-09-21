part of 'pokedex_bloc.dart';

class PokedexState extends Equatable {
  const PokedexState({
    this.isLoading = false,
    this.pokemons = const [],
    this.hasMore = false,
    this.error,
  });

  factory PokedexState.initial() => const PokedexState();

  final bool isLoading;
  final List<PokemonEntity> pokemons;
  final bool hasMore;
  final String? error;

  PokedexState copyWith({
    bool? isLoading,
    List<PokemonEntity>? pokemons,
    bool? hasMore,
    String? error,
  }) => PokedexState(
    isLoading: isLoading ?? false,
    pokemons: pokemons ?? this.pokemons,
    hasMore: hasMore ?? false,
    error: error ?? this.error,
  );

  @override
  List<Object?> get props => [isLoading, pokemons, hasMore, error];
}
