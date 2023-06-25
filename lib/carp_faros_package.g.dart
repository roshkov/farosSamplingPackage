// GENERATED CODE - DO NOT MODIFY BY HAND

part of faros__package;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FarosDatum _$FarosDatumFromJson(Map<String, dynamic> json) => FarosDatum()
  ..id = json['id'] as String?
  ..timestamp = DateTime.parse(json['timestamp'] as String)
  ..movisensTimestamp = json['movisens_timestamp'] as String?
  ..movisensDeviceName = json['movisens_device_name'] as String?;

Map<String, dynamic> _$FarosDatumToJson(FarosDatum instance) {
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

FarosAccelerometerDatum _$FarosAccelerometerDatumFromJson(
        Map<String, dynamic> json) =>
    FarosAccelerometerDatum()
      ..id = json['id'] as String?
      ..timestamp = DateTime.parse(json['timestamp'] as String)
      ..movisensTimestamp = json['movisens_timestamp'] as String?
      ..movisensDeviceName = json['movisens_device_name'] as String?
      ..data = (json['data'] as List<dynamic>?)?.map((e) => e as int).toList()
      ..dataType = json['data_type'] as String?;

Map<String, dynamic> _$FarosAccelerometerDatumToJson(
    FarosAccelerometerDatum instance) {
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

FarosDevice _$FarosDeviceFromJson(Map<String, dynamic> json) => FarosDevice(
      roleName: json['roleName'] as String?,
      address: json['address'] as String,
      sensorName: json['sensorName'] as String,
      sensorLocation: json['sensorLocation'] as String? ?? "chest",
      gender: json['gender'] as String? ?? "male",
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
  val['sensorLocation'] = instance.sensorLocation;
  val['weight'] = instance.weight;
  val['height'] = instance.height;
  val['age'] = instance.age;
  val['gender'] = instance.gender;
  return val;
}
