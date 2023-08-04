// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_routine_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllRoutineDTO _$GetAllRoutineDTOFromJson(Map<String, dynamic> json) =>
    GetAllRoutineDTO(
      success: json['success'] as bool,
      count: json['count'] as int,
      data: (json['data'] as List<dynamic>)
          .map((e) => RoutineApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllRoutineDTOToJson(GetAllRoutineDTO instance) =>
    <String, dynamic>{
      'success': instance.success,
      'count': instance.count,
      'data': instance.data,
    };
