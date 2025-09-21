import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokedex_flutter_assessment/pokedex/domain/entities/pokemon_entity.dart';
import 'package:pokedex_flutter_assessment/pokedex/domain/usecases/get_pokemon_detail_usecase.dart';

part 'pokedex_detail_event.dart';
part 'pokedex_detail_state.dart';

class PokedexDetailBloc extends Bloc<PokedexDetailEvent, PokedexDetailState> {
  PokedexDetailBloc(this._usecase) : super(PokedexDetailState.initial()) {
    on<GetPokemonDetailEvent>(_getPokemonDetailEvent);
  }

  final GetPokemonDetailUsecase _usecase;

  FutureOr<void> _getPokemonDetailEvent(
    GetPokemonDetailEvent event,
    Emitter<PokedexDetailState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    try {
      final pokemon = await _usecase(id: event.id, name: event.name);
      emit(state.copyWith(isLoading: false, pokemon: pokemon));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }
}
