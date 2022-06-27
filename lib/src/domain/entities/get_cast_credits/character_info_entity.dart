import 'package:job_city_challenge/src/domain/entities/core/image_link_options_entity.dart';

class CharacterInfoEntity {
  final String id;
  final String name;
  final ImageLinkOptionsEntity image;

  const CharacterInfoEntity({
    required this.id,
    required this.name,
    required this.image,
  });
}
