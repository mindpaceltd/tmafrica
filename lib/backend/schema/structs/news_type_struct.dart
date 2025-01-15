// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NewsTypeStruct extends BaseStruct {
  NewsTypeStruct({
    String? name,
  }) : _name = name;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  static NewsTypeStruct fromMap(Map<String, dynamic> data) => NewsTypeStruct(
        name: data['name'] as String?,
      );

  static NewsTypeStruct? maybeFromMap(dynamic data) =>
      data is Map ? NewsTypeStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
      }.withoutNulls;

  static NewsTypeStruct fromSerializableMap(Map<String, dynamic> data) =>
      NewsTypeStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'NewsTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NewsTypeStruct && name == other.name;
  }

  @override
  int get hashCode => const ListEquality().hash([name]);
}

NewsTypeStruct createNewsTypeStruct({
  String? name,
}) =>
    NewsTypeStruct(
      name: name,
    );
