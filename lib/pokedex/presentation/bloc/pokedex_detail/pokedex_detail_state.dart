part of 'pokedex_detail_bloc.dart';

class PokedexDetailState extends Equatable {
  const PokedexDetailState({this.isLoading = false, this.pokemon, this.error});

  factory PokedexDetailState.initial() => const PokedexDetailState();

  final bool isLoading;
  final PokemonEntity? pokemon;
  final String? error;

  PokedexDetailState copyWith({
    bool? isLoading,
    PokemonEntity? pokemon,
    String? error,
  }) => PokedexDetailState(
    isLoading: isLoading ?? false,
    pokemon: pokemon ?? this.pokemon,
    error: error ?? this.error,
  );

  @override
  List<Object?> get props => [isLoading, pokemon, error];
}
