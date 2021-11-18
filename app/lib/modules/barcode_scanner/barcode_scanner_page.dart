import 'package:app/modules/barcode_scanner/barcode_scanner_controller.dart';
import 'package:app/modules/barcode_scanner/barcode_scanner_status.dart';
import 'package:app/shared/themes/app_text_styles.dart';
import 'package:app/shared/widgets/bottom_sheet/bottom_sheet.dart';
import 'package:app/shared/widgets/divider_vertical/divider_vertical.dart';
import 'package:app/shared/widgets/label_button/label_button.dart';
import 'package:app/shared/widgets/set_label_buttons/set_label_buttons.dart';
import 'package:flutter/material.dart';

class BarCodeScannerPage extends StatefulWidget {
  const BarCodeScannerPage({Key? key}) : super(key: key);

  @override
  _BarCodeScannerPageState createState() => _BarCodeScannerPageState();
}

class _BarCodeScannerPageState extends State<BarCodeScannerPage> {
  final controller = BarCodeScannerController();

  @override
  void initState() {
    controller.getAvailableCameras();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      left: true,
      right: true,
      child: Stack(
        children: [
          ValueListenableBuilder<BarCodeScannerStatus>(
            valueListenable: controller.statusNotifier,
            builder: (_, status, __) {
              if (status.showCamera) {
                return Container(
                  child: status.cameraController!.buildPreview(),
                );
              } else {
                return Container();
              }
            },
          ),
          RotatedBox(
            quarterTurns: 1,
            child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: Colors.transparent,
                title: Text(
                  "Escaneie o código de barras do boleto",
                  style: TextStyles.buttonBackground,
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.transparent,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              bottomNavigationBar: SetLabelButtons(
                primaryLabel: "Inserir código do bolero",
                secondaryLabel: "Adicionar da galeria",
                primaryOnPressed: () {},
                secondaryOnPressed: () {},
              ),
            ),
          ),
          ValueListenableBuilder<BarCodeScannerStatus>(
            valueListenable: controller.statusNotifier,
            builder: (_, status, __) {
              if (status.hasError) {
                return BottomSheetWidget(
                  primaryLabel: "Escanear novamente",
                  primaryOnPressed: () {
                    controller.getAvailableCameras();
                  },
                  secondaryLabel: "Digitar código",
                  secondaryOnPressed: () {},
                  title: "Não foi possível identificar um código de barras.",
                  subTitle:
                      "Tente escanear novamente ou digite o código do seu boleto.",
                );
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }
}