part of faros__package;

/// The [Movisens] device handler.
/// Only available after the [MovisensProbe] has been initialized.
// Movisens movisens;
// Faros? faros = Faros();

/// User data as specified in the [MovisensMeasure].
/// Only available after the [MovisensProbe] has been initialized.
// UserData? userData;

/// return just stream. and in device_manager you listen to it
class FarosAccelerometerProbe extends StreamProbe {
  @override
  FarosDeviceManager get deviceManager =>
      super.deviceManager as FarosDeviceManager;

  // final Faros _faros = Faros(deviceManager?.deviceDescriptor?.address ?? '');

  @override
  Stream<FarosDatum>? get stream => deviceManager._faros?.accelerometerStream
      ?.map((event) => FarosDatum.fromMap(event));
}
