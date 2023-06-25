// part of faros__package;

// // /// A probe collecting data from the Movisens device using a [StreamProbe].
// class MovisensProbe extends StreamProbe {
//   @override
//   FarosDeviceManager get deviceManager =>
//       super.deviceManager as FarosDeviceManager;

//   @override
//   Stream<FarosDatum> get stream async* {
//     while (true) {
//       await Future.delayed(Duration(seconds: 1));
//       MovisensDatum datum = MovisensHRDatum()
//         ..hr = "72"
//         ..movisensTimestamp = "2023-05-04T12:34:56.000Z"
//         ..movisensDeviceName = "Movisens Device";

//       yield datum;
//     }
//   }
// }

part of faros__package;

/// The [Movisens] device handler.
/// Only available after the [MovisensProbe] has been initialized.
// Movisens movisens;
// Faros? faros = Faros();
// late Faros _faros;
// late UserData userData;

/// User data as specified in the [MovisensMeasure].
/// Only available after the [MovisensProbe] has been initialized.
// UserData? userData;

/// return just stream. and in device_manager you listen to it
class FarosEcgProbe extends StreamProbe {
  @override
  FarosDeviceManager get deviceManager =>
      super.deviceManager as FarosDeviceManager;

  @override
  bool onInitialize() {
    return true;
  }

  @override
  Stream<FarosDatum>? get stream => deviceManager._faros?.ecgStream
      ?.map((event) => FarosDatum.fromMap(event));
}
