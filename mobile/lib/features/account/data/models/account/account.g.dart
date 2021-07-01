// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) {
  return Account(
    userId: json['user_id'] as String,
    type: _$enumDecode(_$AccountTypeEnumMap, json['type']),
  );
}

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'user_id': instance.userId,
      'type': _$AccountTypeEnumMap[instance.type],
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$AccountTypeEnumMap = {
  AccountType.courier: 'courier',
  AccountType.customer: 'customer',
  AccountType.vendor: 'vendor',
};
