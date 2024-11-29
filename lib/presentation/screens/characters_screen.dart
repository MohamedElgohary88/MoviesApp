import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/constants/my_colors.dart';
import '../../data/models/character.dart';
import '../../domain/characters/characters_cubit.dart';
import '../widgets/character_item.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late List<Character> allCharacters = [];
  late List<Character> searchedCharacters = [];
  bool isSearching = false;
  final _SearchTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  Widget buildSearchField() {
    return TextField(
      controller: _SearchTextController,
      cursorColor: MyColors.myGrey,
      decoration: const InputDecoration(
        border: InputBorder.none,
        hintStyle: TextStyle(color: MyColors.myGrey, fontSize: 18),
        hintText: 'Find a character...',
      ),
      style: const TextStyle(color: MyColors.myGrey, fontSize: 18),
      onChanged: (searchedCharacter) {
        addSearchedForCharacter(searchedCharacter);
      },
    );
  }

  void addSearchedForCharacter(String searchedCharacter) {
    searchedCharacters = allCharacters
        .where((character) => character.name
        .toLowerCase()
        .contains(searchedCharacter.toLowerCase()))
        .toList();
    setState(() {}); // Trigger UI rebuild
  }

  void clearSearch() {
    _SearchTextController.clear();
    setState(() {
      isSearching = false;
      searchedCharacters.clear(); // Clear search results
    });
  }

  List<Widget> _buildAppBarActions() {
    if (isSearching) {
      return [
        IconButton(
          onPressed: clearSearch,
          icon: const Icon(
            Icons.clear,
            color: MyColors.myGrey,
          ),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: () {
            setState(() {
              isSearching = true;
              _SearchTextController.clear();
              searchedCharacters.clear(); // Reset search results
            });
          },
          icon: const Icon(
            Icons.search,
            color: MyColors.myGrey,
          ),
        ),
      ];
    }
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          allCharacters = state.characters;

          // Show search results if searching, otherwise all characters
          final charactersToDisplay =
          isSearching && _SearchTextController.text.isNotEmpty
              ? searchedCharacters
              : allCharacters;

          return BuildLoadedListWidget(charactersToDisplay);
        } else if (state is CharactersError) {
          return const Center(
            child: Text('Failed to load characters.'),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget BuildLoadedListWidget(List<Character> characters) {
    return SingleChildScrollView(
      child: Container(
        color: MyColors.myGrey,
        child: Column(
          children: [
            buildCharactersList(characters),
          ],
        ),
      ),
    );
  }

  Widget buildCharactersList(List<Character> characters) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: characters.length,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return CharacterItem(character: characters[index]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: _buildAppBarActions(),
        title: isSearching ? buildSearchField() : const Text('Characters'),
        backgroundColor: MyColors.myYellow,
      ),
      body: buildBlocWidget(),
    );
  }
}