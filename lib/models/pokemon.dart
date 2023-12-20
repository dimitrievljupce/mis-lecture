import 'package:json_annotation/json_annotation.dart';

part 'pokemon.g.dart';

@JsonSerializable()
class Pokemon {
  int? height;
  late int id;
  late String name;
  int? order;
  late Sprites sprites;
  List<Stats>? stats;
  int? weight;

  Pokemon({
    this.height,
    required this.id,
    required this.name,
    this.order,
    required this.sprites,
    this.stats,
    this.weight,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonToJson(this);
}

@JsonSerializable()
class Ability {
  String? name;
  String? url;

  Ability({this.name, this.url});

  factory Ability.fromJson(Map<String, dynamic> json) =>
      _$AbilityFromJson(json);
  Map<String, dynamic> toJson() => _$AbilityToJson(this);
}

@JsonSerializable()
class Sprites {
  @JsonKey(name: "back_default")
  String? backDefault;
  @JsonKey(name: "back_shiny")
  String? backShiny;
  @JsonKey(name: "front_default")
  String? frontDefault;
  @JsonKey(name: "front_shiny")
  String? frontShiny;
  OtherSprites? other;

  Sprites({
    this.backDefault,
    this.backShiny,
    this.frontDefault,
    this.frontShiny,
    this.other,
  });

  factory Sprites.fromJson(Map<String, dynamic> json) =>
      _$SpritesFromJson(json);
  Map<String, dynamic> toJson() => _$SpritesToJson(this);
}

@JsonSerializable()
class OtherSprites {
  @JsonKey(name: "official-artwork")
  OfficialArtwork? officialArtwork;

  OtherSprites({this.officialArtwork});

  factory OtherSprites.fromJson(Map<String, dynamic> json) =>
      _$OtherSpritesFromJson(json);
  Map<String, dynamic> toJson() => _$OtherSpritesToJson(this);
}

@JsonSerializable()
class OfficialArtwork {
  @JsonKey(name: "front_default")
  String? frontDefault;
  @JsonKey(name: "front_shiny")
  String? frontShiny;

  OfficialArtwork({this.frontDefault, this.frontShiny});

  factory OfficialArtwork.fromJson(Map<String, dynamic> json) =>
      _$OfficialArtworkFromJson(json);
  Map<String, dynamic> toJson() => _$OfficialArtworkToJson(this);
}

@JsonSerializable()
class Stats {
  @JsonKey(name: "back_stat")
  int? baseStat;
  int? effort;
  Ability? stat;

  Stats({this.baseStat, this.effort, this.stat});

  factory Stats.fromJson(Map<String, dynamic> json) => _$StatsFromJson(json);
  Map<String, dynamic> toJson() => _$StatsToJson(this);
}
