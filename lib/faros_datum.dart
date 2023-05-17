// class FarosDataObject {
//   Map<String, List<int>>? data;
//   String? dataType;
//   FarosDataObject({required this.data, required this.dataType});
//   factory FarosDataObject.fromMap(Map<Object?, Object?> map) {
//     var data = map['data'] as Map;

//     var castedData = data.map((key, value) {
//       var list = value as List;
//       var castedList = list.cast<int>();
//       return MapEntry(key as String, castedList);
//     });

//     return FarosDataObject(
//       data: castedData,
//       dataType: map['dataType'] as String,
//     );
//   }
// }

/*
 * Copyright 2019-2022 Copenhagen Center for Health Technology (CACHET) at the
 * Technical University of Denmark (DTU).
 * Use of this source code is governed by a MIT-style license that can be
 * found in the LICENSE file.
 */
part of carp_movisens_package;

/// An abstract Datum for all Movisens data points.
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class FarosDatum extends Datum {
  @JsonKey(ignore: true)
  @override
  DataFormat get format => DataFormat.fromString(FarosSamplingPackage.FAROS);

  /// The timestamp from the Movisens device.
  String? movisensTimestamp;

  /// The device name of the Movisens device that collected this datum.
  String? movisensDeviceName;

  FarosDatum() : super();

  factory FarosDatum.fromMap(Map<Object?, Object?> map) {
    var data = map['data'] as Map;
    var dataType = map['dataType'] as String;

    FarosDatum datum = FarosDatum();

    if (dataType == 'ecg') {
      datum = FarosEcgDatum.fromMap(data.toString());
    }

    if (dataType == 'accelometer') {
      datum = FarosAccelometerDatum.fromMap(data);
    }

    // if (map.containsKey("MovementAcceleration")) {
    //   datum = MovisensMovementAccelerationDatum.fromMap(
    //       map["MovementAcceleration"].toString());
    // }

    datum.movisensTimestamp =
        _movisensTimestampToUTC(map['timestamp'].toString());
    datum.movisensDeviceName = 'Faros 360';

    return datum;
  }

  static String _movisensTimestampToUTC(String timestamp) {
    // List<String> splittedTimestamp = timestamp.split(" ");
    // return "${splittedTimestamp[0]}T${splittedTimestamp[1]}.000Z";
    return "2023-05-17T10:30:00.000Z";
  }

  factory FarosDatum.fromJson(Map<String, dynamic> json) =>
      _$FarosDatumFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$FarosDatumToJson(this);
}

// @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
// class MovisensBodyPositionDatum extends FarosDatum {
//   @override
//   DataFormat get format =>
//       DataFormat.fromString(FarosSamplingPackage.BODY_POSITION);

//   String? bodyPosition;

//   MovisensBodyPositionDatum() : super();

//   MovisensBodyPositionDatum.fromMap(String value) {
//     final map = jsonDecode(value);
//     bodyPosition = map['body_position'].toString();
//   }

//   factory MovisensBodyPositionDatum.fromJson(Map<String, dynamic> json) =>
//       _$MovisensBodyPositionDatumFromJson(json);
//   @override
//   Map<String, dynamic> toJson() => _$MovisensBodyPositionDatumToJson(this);
// }

// ecg
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class FarosEcgDatum extends FarosDatum {
  @override
  DataFormat get format => DataFormat.fromString(FarosSamplingPackage.ECG);

  /// Heart Rate (HR) in beats pr. minute (BPM).
  // String? hr;

  List<int>? data;
  String? dataType;

  FarosEcgDatum() : super();

  FarosEcgDatum.fromMap(String value) {
    final data = jsonDecode(value);

    var castedData = data.map((key, value) {
      var list = value as List;
      var castedList = list.cast<int>();
      return MapEntry(key as String, castedList);
    });
  }
  // factory FarosEcgDatum.fromMap(Map<Object?, Object?> map) {
  //   var data = map['data'] as Map;

  //   var castedData = data.map((key, value) {
  //     var list = value as List;
  //     var castedList = list.cast<int>();
  //     return MapEntry(key as String, castedList);
  //   });
  // }

  factory FarosEcgDatum.fromJson(Map<String, dynamic> json) =>
      _$FarosEcgDatumFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$FarosEcgDatumToJson(this);
}

// accelometer
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class FarosAccelometerDatum extends FarosDatum {
  @override
  DataFormat get format =>
      DataFormat.fromString(FarosSamplingPackage.ACCELOMETER);

  List<int>? data;
  String? dataType;

  FarosAccelometerDatum() : super();

  FarosAccelometerDatum.fromMap(Map<Object?, Object?> map) {
    //final data = jsonDecode(value);
    var data = map['data'] as Map;
    dataType = map['dataType'] as String;
    var castedData = data.map((key, value) {
      var list = value as List;
      var castedList = list.cast<int>();
      return MapEntry(key as String, castedList);
    });
  }

  factory FarosAccelometerDatum.fromJson(Map<String, dynamic> json) =>
      _$FarosAccelometerDatumFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$FarosAccelometerDatumToJson(this);
}
