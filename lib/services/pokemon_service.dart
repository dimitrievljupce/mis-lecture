import 'dart:math';

import 'package:dio/dio.dart';
import 'package:pokemon/models/pokemon.dart';

class PokemonService {
  final String url = "https://pokeapi.co/api/v2";
  final dio = Dio();
  final rng = Random();

  Future<Pokemon> getRandomPokemon() async {
    final randomId = rng.nextInt(1000) + 1;
    final path = "$url/pokemon/$randomId";
    final pokemonResponse = await dio.get(path);
    return Pokemon.fromJson(pokemonResponse.data!);
  }

  Future<Pokemon> getPokemonWithId(int id) async {
    final path = "$url/pokemon/$id";
    final pokemonResponse = await dio.get(path);
    return Pokemon.fromJson(pokemonResponse.data!);
  }
}
