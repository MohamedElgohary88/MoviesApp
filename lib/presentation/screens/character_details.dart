import 'package:flutter/material.dart';
import 'package:movies_app/constants/my_colors.dart';

import '../../domain/character_details/character_details_cubit.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final int characterId;
  CharacterDetailsScreen({super.key,required this.characterId});
  final characterDetailsCubit = CharacterDetailsCubit();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myGrey,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar()
        ],
      )
    );
  }

  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.myGrey,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          characterId.toString(),
          style: TextStyle(color: MyColors.myWhite),
        ),
        background: Image.network(
          'https://rickandmortyapi.com/api/character/avatar/${characterId}.jpeg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}