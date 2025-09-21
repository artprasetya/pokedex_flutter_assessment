part of 'pokedex_detail_bloc.dart';

sealed class PokedexDetailEvent extends Equatable {
  const PokedexDetailEvent();

  @override
  List<Object> get props => [];
}

class GetPokemonDetailEvent extends PokedexDetailEvent {
  final String id;
  final String name;

  const GetPokemonDetailEvent({required this.id, required this.name});
}
