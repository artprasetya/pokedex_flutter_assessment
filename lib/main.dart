import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_flutter_assessment/pokedex/presentation/bloc/pokedex_list/pokedex_bloc.dart';
import 'package:pokedex_flutter_assessment/pokedex/presentation/pages/list/pokemon_list_page.dart';
import 'package:pokedex_flutter_assessment/services/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<PokedexBloc>(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pokedex Flutter Assessment',
        home: const PokemonListPage(),
      ),
    );
  }
}
