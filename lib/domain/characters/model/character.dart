import 'package:equatable/equatable.dart';

class Character extends Equatable {
  final String id;
  final String name;
  final String description;
  final String imgUrl;

  const Character({
    required this.id,
    required this.name,
    required this.description,
    required this.imgUrl,
  });

  @override
  List<Object?> get props => [id, name, description, imgUrl];
}
