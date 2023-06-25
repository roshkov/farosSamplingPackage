/*
 * Copyright 2019-2022 Copenhagen Center for Health Technology (CACHET) at the
 * Technical University of Denmark (DTU).
 * Use of this source code is governed by a MIT-style license that can be
 * found in the LICENSE file.
 */

/// A [CARP Mobile Sensing](https://pub.dev/packages/carp_mobile_sensing)
/// sampling package for collecting cardiovascular data from the
/// Movisens Move4 and EcgMove4 devices on:
///
///  * tap marker
///  * heart rate
///  * heart rate variability
///  * metabolic level
///  * body position
///  * step count
///  * movement (accelerometer)
///  * battery level of device
///  * connectivity status to device
library faros__package;

import 'dart:convert';
import 'dart:async';
import 'dart:io' show Platform;
import 'package:faros_plugin/faros.dart';

import 'package:json_annotation/json_annotation.dart';
import 'package:openmhealth_schemas/openmhealth_schemas.dart' as omh;
import 'package:permission_handler/permission_handler.dart';

import 'package:carp_serializable/carp_serializable.dart';
import 'package:carp_core/carp_core.dart';
import 'package:carp_mobile_sensing/carp_mobile_sensing.dart';

part 'faros_datum.dart';
part 'faros_ecg_probe.dart';
part 'faros_accelerometer_probe.dart';
part "carp_faros_package.g.dart";
part 'faros_device_manager.dart';

/// The Movisens sampling package
///
/// To use this package, register it in the [carp_mobile_sensing] package using
///
/// ```
///   SamplingPackageRegistry.register(FarosSamplingPackage());
/// ```
class FarosSamplingPackage implements SamplingPackage {
  ///  * Uses the [FarosDevice] connected device for data collection.
  static const String FAROS = "${NameSpace.CARP}.faros";

  static const String FAROS_NAMESPACE = "${NameSpace.CARP}.faros";
  // static const String HR = "$FAROS_NAMESPACE.hr";
  // static const String BATTERY_LEVEL = "$FAROS_NAMESPACE.battery_level";
  // static const String CONNECTION_STATUS = "$FAROS_NAMESPACE.connection_status";
  static const String ECG = "$FAROS_NAMESPACE.ecg";
  static const String ACCELOMETER = "$FAROS_NAMESPACE.accelerometer";

  final DeviceManager _deviceManager = FarosDeviceManager();

  @override
  void onRegister() {
    FromJsonFactory().register(FarosDevice(
        address: '', sensorName: '')); //by default is empty address, but why?

    // registering the transformers from CARP to OMH and FHIR for heart rate and step count.
    // we assume that there are OMH and FHIR schemas created and registrered already...
    // TransformerSchemaRegistry().lookup(NameSpace.OMH)!.add(
    //       HR,
    //       OMHHeartRateDataPoint.transformer,
    //     );
  }

  @override
  String get deviceType => FarosDevice.DEVICE_TYPE;

  @override
  DeviceManager get deviceManager => _deviceManager;

  @override
  List<Permission> get permissions => []; // no special permissions needed

  /// Create a [FarosEcgProbe]. Only available on Android.
  // @override
  // Probe? create(String type) {

  //  switch (type) {
  //   case: FAROS:
  //     return FarosEcgProbe();
  //     default:
  //     return null;
  //  }
  //   // (Platform.isAndroid)
  //   //   ? (type == FAROS)
  //   //       ? FarosEcgProbe()
  //   //       // : null //CHANGE BACK AFTER TEST
  //   //       : FarosEcgProbe()
  //   //   : null;
  // }

  @override
  Probe? create(String type) {
    switch (type) {
      case 'FAROSECG':
        print("ecg probe created");
        return FarosEcgProbe();
      case 'FAROSACCELOMETER':
        return FarosAccelerometerProbe();
      default:
        print("no probe created");
        return null;
    }
  }

  @override
  List<String> get dataTypes => [FAROS];

  @override
  SamplingSchema get samplingSchema => SamplingSchema();
}
