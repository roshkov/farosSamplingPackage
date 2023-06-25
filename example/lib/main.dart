import 'package:carp_core/carp_core.dart';
import 'package:carp_mobile_sensing/carp_mobile_sensing.dart';
import 'package:faros_package/carp_faros_package.dart';

/// This is a very simple example of how this sampling package is used with
/// CARP Mobile Sensing (CAMS).
/// NOTE, however, that the code below will not run.
/// See the documentation on how to use CAMS: https://github.com/cph-cachet/carp.sensing-flutter/wiki
void main() async {
  // register this sampling package before using its measures
  // SamplingPackageRegistry().register(MovisensSamplingPackage());
  SamplingPackageRegistry().register(FarosSamplingPackage());

  // Create a study protocol
  StudyProtocol protocol = StudyProtocol(
    ownerId: 'owner@dtu.dk',
    name: 'Faros Example',
  );

  // define which devices are used for data collection - both phone and Movisens
  Smartphone phone = Smartphone();

  FarosDevice faros = FarosDevice(
    roleName: 'faros-data',
    address: 'A4:34:F1:26:E4:38',
    sensorLocation: "chest",
    gender: "male",
    sensorName: 'Sensor 1',
    height: 175,
    weight: 75,
    age: 25,
  );

  protocol
    ..addMasterDevice(phone)
    ..addConnectedDevice(faros);

  // adding a movisens measure
  protocol.addTriggeredTask(
      ImmediateTrigger(),
      BackgroundTask(name: 'Movisens Task')
        ..addMeasure(Measure(type: FarosSamplingPackage.FAROS)),
      faros);

  SmartPhoneClientManager client = SmartPhoneClientManager();
  await client.configure();
  Study study = await client.addStudyProtocol(protocol);

  SmartphoneDeploymentController? controller = client.getStudyRuntime(study);
  await controller?.tryDeployment();

  // Configure the controller.
  await controller?.configure();

  // Start the study
  controller?.start();

  // Listening and print all data events from the study
  controller?.data.forEach(print);
}
