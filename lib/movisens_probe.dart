// part of carp_movisens_package;

// /// A probe collecting data from the Movisens device using a [StreamProbe].
// class MovisensProbe extends StreamProbe {
//   @override
//   FarosDeviceManager get deviceManager =>
//       super.deviceManager as FarosDeviceManager;

//   @override
//   Stream<MovisensDatum> get stream async* {
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

/*
 * Copyright 2019-2021 Copenhagen Center for Health Technology (CACHET) at the
 * Technical University of Denmark (DTU).
 * Use of this source code is governed by a MIT-style license that can be
 * found in the LICENSE file.
 */
part of carp_movisens_package;

/// The [Movisens] device handler.
/// Only available after the [MovisensProbe] has been initialized.
// Movisens movisens;
Faros? faros = Faros();

/// User data as specified in the [MovisensMeasure].
/// Only available after the [MovisensProbe] has been initialized.
UserData? userData;

/// return just stream. and in device_manager you listen to it
class MovisensProbe {
  Stream<FarosDatum>? get ecgStream =>
      Faros.ecgStream?.map((event) => FarosDatum.fromMap(event));
}
