part of 'pokedex_bloc.dart';

abstract class PokedexEvent extends Equatable {
  const PokedexEvent();

  @override
  List<Object> get props => [];
}

class GetPokemonListEvent extends PokedexEvent {}

class LoadMorePokemonsEvent extends PokedexEvent {}

class SearchPokemonEvent extends PokedexEvent {
  final String pokemonName;
  const SearchPokemonEvent({required this.pokemonName});
}
