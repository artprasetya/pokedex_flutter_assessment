import 'package:pokedex_flutter_assessment/pokedex/domain/entities/pokemon_entity.dart';

class PokemonModel {
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

  PokemonModel({
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

  factory PokemonModel.fromJson(Map<String, dynamic> json) => PokemonModel(
    id: json["id"],
    number: json["number"],
    name: json["name"],
    types:
        json["types"] == null
            ? []
            : List<String>.from(json["types"]!.map((x) => x)),
    image: json["image"],
    classification: json["classification"],
    maxHp: json["maxHP"],
    maxCp: json["maxCP"],
    evolutions:
        json["evolutions"] == null
            ? []
            : List<Evolution>.from(
              json["evolutions"]!.map((x) => Evolution.fromJson(x)),
            ),
    attacks: json["attacks"] == null ? null : Attacks.fromJson(json["attacks"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "number": number,
    "name": name,
    "types": types == null ? [] : List<dynamic>.from(types!.map((x) => x)),
    "image": image,
    "classification": classification,
    "maxHP": maxHp,
    "maxCP": maxCp,
    "evolutions":
        evolutions == null
            ? []
            : List<dynamic>.from(evolutions!.map((x) => x.toJson())),
    "attacks": attacks?.toJson(),
  };

  PokemonEntity toEntity() => PokemonEntity(
    id: id,
    number: number,
    name: name,
    types: types,
    image: image,
    classification: classification,
    maxHp: maxHp,
    maxCp: maxCp,
    evolutions: evolutions,
    attacks: attacks,
  );
}

class Attacks {
  final List<Fast>? fast;
  final List<Fast>? special;

  Attacks({this.fast, this.special});

  factory Attacks.fromJson(Map<String, dynamic> json) => Attacks(
    fast:
        json["fast"] == null
            ? []
            : List<Fast>.from(json["fast"]!.map((x) => Fast.fromJson(x))),
    special:
        json["special"] == null
            ? []
            : List<Fast>.from(json["special"]!.map((x) => Fast.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "fast":
        fast == null ? [] : List<dynamic>.from(fast!.map((x) => x.toJson())),
    "special":
        special == null
            ? []
            : List<dynamic>.from(special!.map((x) => x.toJson())),
  };
}

class Fast {
  final String? name;
  final String? type;
  final int? damage;

  Fast({this.name, this.type, this.damage});

  factory Fast.fromJson(Map<String, dynamic> json) =>
      Fast(name: json["name"], type: json["type"], damage: json["damage"]);

  Map<String, dynamic> toJson() => {
    "name": name,
    "type": type,
    "damage": damage,
  };
}

class Evolution {
  final String? id;
  final String? number;
  final String? name;
  final String? image;

  Evolution({this.id, this.number, this.name, this.image});

  factory Evolution.fromJson(Map<String, dynamic> json) => Evolution(
    id: json["id"],
    number: json["number"],
    name: json["name"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "number": number,
    "name": name,
    "image": image,
  };
}
