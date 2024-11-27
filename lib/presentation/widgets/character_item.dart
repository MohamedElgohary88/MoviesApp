import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:movies_app/constants/my_colors.dart';
import '../../data/models/character.dart';

class CharacterItem extends StatelessWidget {
  final Character character;

  const CharacterItem({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: MyColors.myGrey, borderRadius: BorderRadius.circular(8)),
      child: GridTile(
        child: Container(
          color: MyColors.myGrey,
          child: character.image.isNotEmpty
              ? FadeInImage.assetNetwork(
                  placeholder: 'assets/images/loading.gif',
                  image: character.image,
                  height: 300,
                  width: 300,
                  fit: BoxFit.cover,
                )
              : const Text(
                  'Image not available'), // Fallback in case image is empty
        ),
        footer: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          color: Colors.black54,
          child: Text(
            character.name,
            style: const TextStyle(
                height: 1.3,
                color: MyColors.myWhite,
                fontWeight: FontWeight.bold,
                fontSize: 16),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
          alignment: Alignment.bottomCenter,
        ),
      ),
    );
  }
}
