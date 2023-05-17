// /*
//  * Copyright 2019-2022 Copenhagen Center for Health Technology (CACHET) at the
//  * Technical University of Denmark (DTU).
//  * Use of this source code is governed by a MIT-style license that can be
//  * found in the LICENSE file.
//  */
// part of carp_movisens_package;

// /// An abstract Datum for all Movisens data points.
// @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
// class FarosDatum extends Datum {
//   @JsonKey(ignore: true)
//   @override
//   DataFormat get format => DataFormat.fromString(FarosSamplingPackage.FAROS);

//   /// The timestamp from the Movisens device.
//   String? movisensTimestamp;

//   /// The device name of the Movisens device that collected this datum.
//   String? movisensDeviceName;

//   FarosDatum() : super();

//   factory FarosDatum.fromMap(
//     Map<String, dynamic> map, [
//     String? deviceName,
//   ]) {
//     FarosDatum datum = FarosDatum();

//     if (map.containsKey("MetLevel")) {
//       datum = MovisensMETLevelDatum.fromMap(map["MetLevel"].toString());
//     }
//     if (map.containsKey("Met")) {
//       datum = MovisensMETDatum.fromMap(map["Met"].toString());
//     }
//     if (map.containsKey("HR")) {
//       datum = MovisensHRDatum.fromMap(map["HR"].toString());
//     }
//     if (map.containsKey("HRV")) {
//       datum = MovisensHRVDatum.fromMap(map["HRV"].toString());
//     }
//     if (map.containsKey("IsHrvValid")) {
//       datum = MovisensIsHrvValidDatum.fromMap(map["IsHrvValid"].toString());
//     }
//     if (map.containsKey("BodyPosition")) {
//       datum = MovisensBodyPositionDatum.fromMap(map["BodyPosition"].toString());
//     }
//     if (map.containsKey("StepCount")) {
//       datum = MovisensStepCountDatum.fromMap(map["StepCount"].toString());
//     }
//     if (map.containsKey("MovementAcceleration")) {
//       datum = MovisensMovementAccelerationDatum.fromMap(
//           map["MovementAcceleration"].toString());
//     }
//     if (map.containsKey("TapMarker")) {
//       datum = MovisensTapMarkerDatum.fromMap(map["TapMarker"].toString());
//     }
//     if (map.containsKey("BatteryLevel")) {
//       datum = MovisensBatteryLevelDatum.fromMap(map["BatteryLevel"].toString());
//     }
//     if (map.containsKey("ConnectionStatus")) {
//       datum = MovisensConnectionStatusDatum.fromMap(
//           map["ConnectionStatus"].toString());
//     }

//     datum.movisensTimestamp =
//         _movisensTimestampToUTC(map['timestamp'].toString());
//     datum.movisensDeviceName = deviceName;

//     return datum;
//   }

//   /// Make a Movisens timestamp into UTC format
//   static String _movisensTimestampToUTC(String timestamp) {
//     List<String> splittedTimestamp = timestamp.split(" ");
//     return "${splittedTimestamp[0]}T${splittedTimestamp[1]}.000Z";
//   }

//   factory FarosDatum.fromJson(Map<String, dynamic> json) =>
//       _$FarosDatumFromJson(json);

//   @override
//   Map<String, dynamic> toJson() => _$FarosDatumToJson(this);
// }


// /// Heart Rate (HR) in beats pr. minute (BPM).
// @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
// class FarosECGDatum extends FarosDatum {
//   @override
//   DataFormat get format => DataFormat.fromString(FarosSamplingPackage.HR);

//   /// Heart Rate (HR) in beats pr. minute (BPM).
//   String? hr;

//   MovisensHRDatum() : super();

//   MovisensHRDatum.fromMap(String value) {
//     final map = jsonDecode(value);
//     hr = map['hr'].toString();
//   }

//   factory MovisensHRDatum.fromJson(Map<String, dynamic> json) =>
//       _$MovisensHRDatumFromJson(json);
//   @override
//   Map<String, dynamic> toJson() => _$MovisensHRDatumToJson(this);
// }

// /// Heart rate variability (HRV).
// @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
// class MovisensHRVDatum extends FarosDatum {
//   @override
//   DataFormat get format => DataFormat.fromString(FarosSamplingPackage.HRV);

//   String? hrv;

//   MovisensHRVDatum() : super();

//   MovisensHRVDatum.fromMap(String value) {
//     final map = jsonDecode(value);
//     hrv = map['hrv'].toString();
//   }

//   factory MovisensHRVDatum.fromJson(Map<String, dynamic> json) =>
//       _$MovisensHRVDatumFromJson(json);
//   @override
//   Map<String, dynamic> toJson() => _$MovisensHRVDatumToJson(this);
// }

// @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
// class MovisensIsHrvValidDatum extends FarosDatum {
//   @override
//   DataFormat get format =>
//       DataFormat.fromString(FarosSamplingPackage.IS_HRV_VALID);

//   String? isHrvValid;

//   MovisensIsHrvValidDatum() : super();

//   MovisensIsHrvValidDatum.fromMap(String value) {
//     final map = jsonDecode(value);
//     isHrvValid = map['is_hrv_valid'].toString();
//   }

//   factory MovisensIsHrvValidDatum.fromJson(Map<String, dynamic> json) =>
//       _$MovisensIsHrvValidDatumFromJson(json);
//   @override
//   Map<String, dynamic> toJson() => _$MovisensIsHrvValidDatumToJson(this);
// }

// /// Step counts as measured by the Movisens device.
// @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
// class MovisensStepCountDatum extends FarosDatum {
//   @override
//   DataFormat get format =>
//       DataFormat.fromString(FarosSamplingPackage.STEP_COUNT);

//   String? stepCount;

//   MovisensStepCountDatum() : super();

//   MovisensStepCountDatum.fromMap(String value) {
//     final map = jsonDecode(value);
//     stepCount = map['step_count'].toString();
//   }
//   factory MovisensStepCountDatum.fromJson(Map<String, dynamic> json) =>
//       _$MovisensStepCountDatumFromJson(json);
//   @override
//   Map<String, dynamic> toJson() => _$MovisensStepCountDatumToJson(this);
// }

// /// Connectivity status of the Movisens device.
// @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
// class MovisensConnectionStatusDatum extends FarosDatum {
//   @override
//   DataFormat get format =>
//       DataFormat.fromString(FarosSamplingPackage.CONNECTION_STATUS);

//   String? connectionStatus;

//   MovisensConnectionStatusDatum() : super();

//   MovisensConnectionStatusDatum.fromMap(String value) {
//     final map = jsonDecode(value);
//     connectionStatus = map['connection_status'].toString();
//   }

//   factory MovisensConnectionStatusDatum.fromJson(Map<String, dynamic> json) =>
//       _$MovisensConnectionStatusDatumFromJson(json);
//   @override
//   Map<String, dynamic> toJson() => _$MovisensConnectionStatusDatumToJson(this);
// }
