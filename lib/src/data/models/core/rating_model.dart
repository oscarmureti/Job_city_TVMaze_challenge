import 'package:job_city_challenge/src/domain/entities/core/rating_entity.dart';

class RatingModel extends RatingEntity {
  final String dtoAverage;

  const RatingModel({
    required this.dtoAverage,
  }) : super(average: dtoAverage);

  factory RatingModel.fromMap(Map<String, dynamic> map) {
    return RatingModel(
      dtoAverage: (map['average'] ?? '-').toString(),
    );
  }
}
