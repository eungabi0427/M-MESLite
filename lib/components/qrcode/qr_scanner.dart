import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:scmes_lite/components/qrcode/qr_scanner_overlay.dart';

class QRScanner extends StatefulWidget {
  const QRScanner({Key? key}) : super(key: key);

  @override
  State<QRScanner> createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  MobileScannerController cameraController = MobileScannerController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MobileScanner(
            allowDuplicates: false,
            controller: cameraController,
            onDetect: (Barcode barcode, MobileScannerArguments? args) {
              if (barcode.rawValue == null) {
                debugPrint('Failed to scan Barcode');
              } else {
                final String code = barcode.rawValue!;
                debugPrint('Barcode found! $code');
              }
            }),
        QRScannerOverlay(overlayColor: Colors.black.withOpacity(0.5)),
      ],
    );
  }
}
