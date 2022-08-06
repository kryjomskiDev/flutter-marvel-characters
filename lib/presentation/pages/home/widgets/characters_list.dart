import 'package:flutter/material.dart';
import 'package:marvel_characters/domain/characters/model/character.dart';
import 'package:marvel_characters/extension/extension_mixin.dart';
import 'package:marvel_characters/presentation/widgets/character_card.dart';

class CharactersList extends StatelessWidget {
  final bool isLoading;
  final List<Character> characters;
  final ScrollController controller;

  const CharactersList({required this.characters, required this.isLoading, required this.controller, super.key});

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: controller,
              itemBuilder: (_, index) => CharacterCard(
                character: characters[index],
              ),
              itemCount: characters.length,
            ),
          ),
          if (isLoading)
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircularProgressIndicator(
                  color: context.getColors().white,
                ),
              ),
            )
        ],
      );
}
