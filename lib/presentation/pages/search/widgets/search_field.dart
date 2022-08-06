import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marvel_characters/extension/extension_mixin.dart';
import 'package:marvel_characters/generated/l10n.dart';
import 'package:marvel_characters/style/app_typography.dart';

class SearchField extends StatefulWidget {
  final void Function(String) onSubmitted;
  const SearchField({required this.onSubmitted, super.key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;

  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
        decoration: BoxDecoration(
          color: context.getColors().bgColor,
        ),
        child: TextField(
          focusNode: _focusNode,
          controller: _controller,
          textCapitalization: TextCapitalization.words,
          style: _getTextFieldTextStyle(context),
          cursorColor: context.getColors().white,
          onSubmitted: _onSubmitted,
          decoration: _inputDecoration(context),
        ),
      );

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _focusNode.unfocus();
    _focusNode.dispose();
  }

  InputDecoration _inputDecoration(BuildContext context) {
    final Color white = context.getColors().white;
    return InputDecoration(
      fillColor: context.getColors().transparent,
      iconColor: white,
      focusColor: white,
      labelText: Strings.of(context).search,
      disabledBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      labelStyle: _getTextFieldTextStyle(context),
      hintStyle: _getTextFieldTextStyle(context),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 16.0.w,
        vertical: 8.0.h,
      ),
      prefixIcon: Icon(
        Icons.search,
        color: white,
      ),
    );
  }

  void _onSubmitted(String text) {
    widget.onSubmitted(text.trim());
    _controller.clear();
    _focusNode.unfocus();
  }

  TextStyle? _getTextFieldTextStyle(BuildContext context) => AppTypography.textFieldText.copyWith(
        color: context.getColors().white,
      );
}
