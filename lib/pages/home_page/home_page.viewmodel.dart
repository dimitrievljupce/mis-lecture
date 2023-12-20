import 'package:flutter/material.dart';
import 'package:pokemon/models/pokemon.dart';
import 'package:pokemon/services/pokemon_service.dart';

class HomePageViewModel extends ChangeNotifier {
  HomePageViewModel() {
    _pokemonService.getPokemonWithId(1).then((value) {
      pokemon = value;
      isLoading = false;
    });
  }

  final _pokemonService = PokemonService();
  bool _isLoading = true;
  Pokemon? pokemon;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool get isLoading => _isLoading;
  bool get hasNextPokemon => (pokemon?.id ?? 9999999) < 1000;
  bool get hasPreviousPokemon => (pokemon?.id ?? 0) > 1;

  Future<void> getRandomPokemon() async {
    if (isLoading) {
      return;
    }

    isLoading = true;
    await Future<void>.delayed(const Duration(milliseconds: 500));

    pokemon = await _pokemonService.getRandomPokemon();
    notifyListeners();

    isLoading = false;
  }

  Future<void> getNextPokemon() async {
    if (isLoading) {
      return;
    }

    isLoading = true;
    await Future<void>.delayed(const Duration(milliseconds: 500));

    pokemon = await _pokemonService.getPokemonWithId(pokemon!.id + 1);
    notifyListeners();

    isLoading = false;
  }

  Future<void> getPreviousPokemon() async {
    if (isLoading) {
      return;
    }

    isLoading = true;
    await Future<void>.delayed(const Duration(milliseconds: 500));

    pokemon = await _pokemonService.getPokemonWithId(pokemon!.id - 1);
    notifyListeners();

    isLoading = false;
  }
}
