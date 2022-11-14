import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/bloc/pokemon_bloc.dart';
import 'package:pokemon/src/widget/pokemon_widget.dart';

class PokemonScreen extends StatelessWidget {
  const PokemonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<PokemonBloc, PokemonState>(builder: (context, state) {
        if (state is PokemonInitial) {
          return const Center(
            child: FlutterLogo(
              size: 120,
              curve: Curves.bounceInOut,
            ),
          );
        } else if (state is PokemonLoaded) {
          return ListView.separated(
            itemBuilder: (context, index) {
              return PokemonWidget.instance
                  .listPokemon(context, state.listPokemon[index]);
            },
            separatorBuilder: (context, index) =>
                const Padding(padding: EdgeInsets.only(top: 8)),
            itemCount: state.listPokemon.length,
          );
        }
        return const SizedBox();
      }),
    );
  }
}