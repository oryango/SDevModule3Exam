// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetEntries _$GetEntriesFromJson(Map<String, dynamic> json) => GetEntries(
      animals: json['animals'],
      pagination: json['pagination'],
    );

Map<String, dynamic> _$GetEntriesToJson(GetEntries instance) =>
    <String, dynamic>{
      'animals': instance.animals,
      'pagination': instance.pagination,
    };

PetEntries _$PetEntriesFromJson(Map<String, dynamic> json) => PetEntries(
      id: json['id'],
      type: json['type'],
    );

Map<String, dynamic> _$PetEntriesToJson(PetEntries instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
    };
