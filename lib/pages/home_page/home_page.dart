import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pokemon/pages/home_page/home_page.viewmodel.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    color: theme.primaryColor,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(),
              ),
            ],
          ),
          SafeArea(
            child: context.watch<HomePageViewModel>().isLoading
                ? Center(
                    child: LottieBuilder.asset(
                      "assets/pokeball_animation.json",
                      width: 80,
                      height: 80,
                    ),
                  )
                : Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 20,
                        ),
                        child: FittedBox(
                          child: Text(
                            context
                                    .watch<HomePageViewModel>()
                                    .pokemon
                                    ?.name
                                    .toUpperCase() ??
                                "",
                            style: theme.textTheme.displayLarge?.copyWith(
                              color: theme.colorScheme.onPrimary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Image.network(
                          context
                                  .watch<HomePageViewModel>()
                                  .pokemon
                                  ?.sprites
                                  .other
                                  ?.officialArtwork
                                  ?.frontDefault ??
                              "",
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton.filledTonal(
                                  iconSize: 45,
                                  onPressed: context
                                          .watch<HomePageViewModel>()
                                          .hasPreviousPokemon
                                      ? context
                                          .read<HomePageViewModel>()
                                          .getPreviousPokemon
                                      : null,
                                  icon: Icon(
                                    Icons.chevron_left,
                                    color: theme.primaryColor,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                IconButton.filledTonal(
                                  iconSize: 45,
                                  onPressed: context
                                      .read<HomePageViewModel>()
                                      .getRandomPokemon,
                                  icon: Icon(
                                    Icons.refresh,
                                    color: theme.primaryColor,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                IconButton.filledTonal(
                                  iconSize: 45,
                                  onPressed: context
                                          .watch<HomePageViewModel>()
                                          .hasNextPokemon
                                      ? context
                                          .read<HomePageViewModel>()
                                          .getNextPokemon
                                      : null,
                                  icon: Icon(
                                    Icons.chevron_right,
                                    color: theme.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              context
                                      .watch<HomePageViewModel>()
                                      .pokemon
                                      ?.id
                                      .toString() ??
                                  "",
                              style: theme.textTheme.headlineMedium,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
