import 'package:camera/camera.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

class BarCodeScannerStatus {
  final bool isCameraAvailable;
  final String error;
  final String barcode;
  final bool sttopScanner;

  BarCodeScannerStatus({
    this.isCameraAvailable = false,
    this.error = "",
    this.barcode = "",
    this.sttopScanner = false
  });

  factory BarCodeScannerStatus.available() =>
      BarCodeScannerStatus(
        isCameraAvailable: true,
        sttopScanner: false,
      );

  factory BarCodeScannerStatus.error(String error) => BarCodeScannerStatus(
        error: error,
        sttopScanner: true,
      );

  factory BarCodeScannerStatus.barcode(String barcode) => BarCodeScannerStatus(
        barcode: barcode,
        sttopScanner: true
      );

  bool get showCamera => isCameraAvailable && error.isEmpty;

  bool get hasError => error.isNotEmpty;

  bool get hasBarcode => barcode.isNotEmpty;
}
