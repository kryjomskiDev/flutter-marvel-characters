import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marvel_characters/domain/characters/model/character.dart';
import 'package:marvel_characters/style/app_typography.dart';

class CharacterDetailsPage extends StatelessWidget {
  final Character character;

  const CharacterDetailsPage({required this.character, super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.network(
              character.imgUrl,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            character.name,
            style: AppTypography.title,
          ),
          SizedBox(height: 20.h),
          Text(
            character.description,
            style: AppTypography.title,
          )
        ],
      ));
}
