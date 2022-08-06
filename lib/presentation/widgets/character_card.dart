import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marvel_characters/domain/characters/model/character.dart';
import 'package:marvel_characters/extension/extension_mixin.dart';
import 'package:marvel_characters/presentation/router/router.gr.dart';
import 'package:marvel_characters/style/app_typography.dart';

class CharacterCard extends StatelessWidget {
  final Character character;
  const CharacterCard({required this.character, super.key});

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => AutoRouter.of(context).navigate(
          CharacterDetailsRoute(character: character),
        ),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.h),
          height: 180.h,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(character.imgUrl),
            ),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: context.getColors().black.withOpacity(0.6),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10.r),
                ),
              ),
              child: Text(
                character.name,
                style: AppTypography.subTitle,
              ),
            ),
          ),
        ),
      );
}
