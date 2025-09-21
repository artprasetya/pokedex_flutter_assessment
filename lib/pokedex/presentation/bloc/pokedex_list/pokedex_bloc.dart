import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokedex_flutter_assessment/pokedex/domain/entities/pokemon_entity.dart';
import 'package:pokedex_flutter_assessment/pokedex/domain/usecases/get_pokemon_list_usecase.dart';

part 'pokedex_event.dart';
part 'pokedex_state.dart';

class PokedexBloc extends Bloc<PokedexEvent, PokedexState> {
  PokedexBloc(this._usecase) : super(PokedexState.initial()) {
    on<GetPokemonListEvent>(_getPokemonListEvent);
    on<LoadMorePokemonsEvent>(_onLoadMorePokemonsEvent);
    on<SearchPokemonEvent>(_searchPokemonEvent);
  }

  final GetPokemonListUsecase _usecase;

  final int _pageSize = 10;
  List<PokemonEntity> _allPokemons = [];
  int _loaded = 0;

  FutureOr<void> _getPokemonListEvent(
    GetPokemonListEvent event,
    Emitter<PokedexState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    try {
      final pokemons = await _usecase(100);
      _allPokemons = pokemons;

      final initial = pokemons.take(_pageSize).toList();
      _loaded = initial.length;

      emit(
        state.copyWith(
          isLoading: false,
          pokemons: initial,
          hasMore: _loaded < pokemons.length,
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  FutureOr<void> _onLoadMorePokemonsEvent(
    LoadMorePokemonsEvent event,
    Emitter<PokedexState> emit,
  ) {
    final current = state.pokemons;
    final next = _allPokemons.skip(_loaded).take(_pageSize).toList();
    _loaded += next.length;

    emit(
      state.copyWith(
        isLoading: false,
        pokemons: [...current, ...next],
        hasMore: _loaded < _allPokemons.length,
      ),
    );
  }

  FutureOr<void> _searchPokemonEvent(
    SearchPokemonEvent event,
    Emitter<PokedexState> emit,
  ) {}
}
