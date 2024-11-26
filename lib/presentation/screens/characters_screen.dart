import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/constants/my_colors.dart';
import '../../data/models/character.dart';
import '../../domain/characters_cubit.dart';
import '../widgets/character_item.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text('Characters Screen'),
    );
  }

  @override
  State<StatefulWidget> createState() {
    return _CharactersScreenState();
  }
}

class _CharactersScreenState extends State<CharactersScreen> {

  late List<Character> allCharacters;

  @override
  void initState() {
    super.initState();
    allCharacters =
        BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
        builder: (context, state) {
          if (state is CharactersLoaded) {
            allCharacters = state.characters;
            return BuildLoadedListWidget();
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }
    );
  }

  Widget BuildLoadedListWidget() {
    return SingleChildScrollView(
        child: Container(
          color: MyColors.myGrey,
          child: Column(
            children: [
              buildCharactersList(),
            ]
          ),
        )
    );
  }

  Widget buildCharactersList() {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
            mainAxisSpacing: 1,
            crossAxisSpacing: 1
        ),
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: allCharacters.length,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return CharacterItem();
        }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text(
        'Characters',
        style: TextStyle(color: MyColors.myGrey),
    ),backgroundColor:MyColors.myYellow,),body:buildBlocWidget()
    );
  }
}
