// GENERATED CODE - DO NOT MODIFY BY HAND

part of carp_movisens_package;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovisensDatum _$MovisensDatumFromJson(Map<String, dynamic> json) =>
    MovisensDatum()
      ..id = json['id'] as String?
      ..timestamp = DateTime.parse(json['timestamp'] as String)
      ..movisensTimestamp = json['movisens_timestamp'] as String?
      ..movisensDeviceName = json['movisens_device_name'] as String?;

Map<String, dynamic> _$MovisensDatumToJson(MovisensDatum instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['timestamp'] = instance.timestamp.toIso8601String();
  writeNotNull('movisens_timestamp', instance.movisensTimestamp);
  writeNotNull('movisens_device_name', instance.movisensDeviceName);
  return val;
}

MovisensBodyPositionDatumC _$MovisensBodyPositionDatumCFromJson(
        Map<String, dynamic> json) =>
    MovisensBodyPositionDatumC()
      ..id = json['id'] as String?
      ..timestamp = DateTime.parse(json['timestamp'] as String)
      ..movisensTimestamp = json['movisens_timestamp'] as String?
      ..movisensDeviceName = json['movisens_device_name'] as String?
      ..bodyPosition = json['body_position'] as String?;

Map<String, dynamic> _$MovisensBodyPositionDatumCToJson(
    MovisensBodyPositionDatumC instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['timestamp'] = instance.timestamp.toIso8601String();
  writeNotNull('movisens_timestamp', instance.movisensTimestamp);
  writeNotNull('movisens_device_name', instance.movisensDeviceName);
  writeNotNull('body_position', instance.bodyPosition);
  return val;
}

FarosEcgDatum _$FarosEcgDatumFromJson(Map<String, dynamic> json) =>
    FarosEcgDatum()
      ..id = json['id'] as String?
      ..timestamp = DateTime.parse(json['timestamp'] as String)
      ..movisensTimestamp = json['movisens_timestamp'] as String?
      ..movisensDeviceName = json['movisens_device_name'] as String?
      ..data = (json['data'] as List<dynamic>?)?.map((e) => e as int).toList()
      ..dataType = json['data_type'] as String?;

Map<String, dynamic> _$FarosEcgDatumToJson(FarosEcgDatum instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['timestamp'] = instance.timestamp.toIso8601String();
  writeNotNull('movisens_timestamp', instance.movisensTimestamp);
  writeNotNull('movisens_device_name', instance.movisensDeviceName);
  writeNotNull('data', instance.data);
  writeNotNull('data_type', instance.dataType);
  return val;
}

FarosAccelometerDatum _$FarosAccelometerDatumFromJson(
        Map<String, dynamic> json) =>
    FarosAccelometerDatum()
      ..id = json['id'] as String?
      ..timestamp = DateTime.parse(json['timestamp'] as String)
      ..movisensTimestamp = json['movisens_timestamp'] as String?
      ..movisensDeviceName = json['movisens_device_name'] as String?
      ..hr = json['hr'] as String?;

Map<String, dynamic> _$FarosAccelometerDatumToJson(
    FarosAccelometerDatum instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['timestamp'] = instance.timestamp.toIso8601String();
  writeNotNull('movisens_timestamp', instance.movisensTimestamp);
  writeNotNull('movisens_device_name', instance.movisensDeviceName);
  writeNotNull('hr', instance.hr);
  return val;
}

FarosDevice _$FarosDeviceFromJson(Map<String, dynamic> json) => FarosDevice(
      roleName: json['roleName'] as String?,
      address: json['address'] as String,
      sensorName: json['sensorName'] as String,
      sensorLocation: $enumDecodeNullable(
              _$SensorLocationEnumMap, json['sensorLocation']) ??
          SensorLocation.chest,
      gender:
          $enumDecodeNullable(_$GenderEnumMap, json['gender']) ?? Gender.male,
      height: json['height'] as int? ?? 178,
      weight: json['weight'] as int? ?? 78,
      age: json['age'] as int? ?? 25,
    )
      ..$type = json['__type'] as String?
      ..isMasterDevice = json['isMasterDevice'] as bool?
      ..supportedDataTypes = (json['supportedDataTypes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
      ..samplingConfiguration =
          (json['samplingConfiguration'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            k, SamplingConfiguration.fromJson(e as Map<String, dynamic>)),
      );

Map<String, dynamic> _$FarosDeviceToJson(FarosDevice instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('__type', instance.$type);
  writeNotNull('isMasterDevice', instance.isMasterDevice);
  val['roleName'] = instance.roleName;
  writeNotNull('supportedDataTypes', instance.supportedDataTypes);
  val['samplingConfiguration'] = instance.samplingConfiguration;
  val['address'] = instance.address;
  val['sensorName'] = instance.sensorName;
  val['sensorLocation'] = _$SensorLocationEnumMap[instance.sensorLocation]!;
  val['weight'] = instance.weight;
  val['height'] = instance.height;
  val['age'] = instance.age;
  val['gender'] = _$GenderEnumMap[instance.gender]!;
  return val;
}

const _$SensorLocationEnumMap = {
  SensorLocation.left_ankle: 'left_ankle',
  SensorLocation.left_hip: 'left_hip',
  SensorLocation.left_thigh: 'left_thigh',
  SensorLocation.left_upper_arm: 'left_upper_arm',
  SensorLocation.left_wrist: 'left_wrist',
  SensorLocation.right_ankle: 'right_ankle',
  SensorLocation.right_hip: 'right_hip',
  SensorLocation.right_thigh: 'right_thigh',
  SensorLocation.right_upper_arm: 'right_upper_arm',
  SensorLocation.right_wrist: 'right_wrist',
  SensorLocation.chest: 'chest',
};

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
};
