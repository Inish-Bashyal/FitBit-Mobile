import 'package:fitbit/features/routine/data/model/routine_api_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_all_routine_dto.g.dart';

@JsonSerializable()
class GetAllRoutineDTO {
  final bool success;
  final int count;
  final List<RoutineApiModel> data;

  GetAllRoutineDTO({
    required this.success,
    required this.count,
    required this.data,
  });

  Map<String, dynamic> toJson() => _$GetAllRoutineDTOToJson(this);

  factory GetAllRoutineDTO.fromJson(Map<String, dynamic> json) =>
      _$GetAllRoutineDTOFromJson(json);
}
