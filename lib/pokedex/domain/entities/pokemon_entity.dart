import 'package:equatable/equatable.dart';
import 'package:pokedex_flutter_assessment/pokedex/data/models/pokemon_model.dart';

class PokemonEntity extends Equatable {
  final String? id;
  final String? number;
  final String? name;
  final List<String>? types;
  final String? image;
  final String? classification;
  final int? maxHp;
  final int? maxCp;
  final List<Evolution>? evolutions;
  final Attacks? attacks;

  const PokemonEntity({
    this.id,
    this.number,
    this.name,
    this.types,
    this.image,
    this.classification,
    this.maxHp,
    this.maxCp,
    this.evolutions,
    this.attacks,
  });

  @override
  List<Object?> get props => [
    id,
    number,
    name,
    types,
    image,
    classification,
    maxHp,
    maxCp,
    evolutions,
    attacks,
  ];
}
