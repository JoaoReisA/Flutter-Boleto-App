import 'package:camera/camera.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

class BarCodeScannerStatus {
  final bool isCameraAvailable;
  final String error;
  final String barcode;

  CameraController? cameraController;

  BarCodeScannerStatus({
    this.isCameraAvailable = false,
    this.error = "",
    this.barcode = "",
    this.cameraController,
  });

  factory BarCodeScannerStatus.available(CameraController controller) =>
      BarCodeScannerStatus(
        isCameraAvailable: true,
        cameraController: controller,
      );

  factory BarCodeScannerStatus.error(String error) => BarCodeScannerStatus(
        error: error,
      );

  factory BarCodeScannerStatus.barcode(String barcode) => BarCodeScannerStatus(
        barcode: barcode,
      );

  bool get showCamera => isCameraAvailable && error.isEmpty;

  bool get hasError => error.isNotEmpty;

  bool get hasBarcode => barcode.isNotEmpty;
}
