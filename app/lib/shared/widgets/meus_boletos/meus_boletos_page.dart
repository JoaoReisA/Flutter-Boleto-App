import 'package:app/shared/models/boleto_model.dart';
import 'package:app/shared/themes/app_colors.dart';
import 'package:app/shared/themes/app_text_styles.dart';
import 'package:app/shared/widgets/boleto_info/boleto_info_widget.dart';
import 'package:app/shared/widgets/boleto_list/boleto_list_controller.dart';
import 'package:app/shared/widgets/boleto_list/boleto_list_widget.dart';
import 'package:flutter/material.dart';

class MeusBoletosPage extends StatefulWidget {
  const MeusBoletosPage({Key? key}) : super(key: key);

  @override
  State<MeusBoletosPage> createState() => _MeusBoletosPageState();
}

class _MeusBoletosPageState extends State<MeusBoletosPage> {
  final controller = BoletoListController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 40,
                  color: AppColors.primary,
                  width: double.maxFinite,
                ),
                 Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 24),
                  child: ValueListenableBuilder<List<BoletoModel>>(
                    valueListenable: controller.boletosNotifier,
                    builder: (_,boletos,__) {
                      return BoletoInfoWidget(size: boletos.length);
                    }
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  Text(
                    "Meus Boletos",
                    style: TextStyles.titleBoldHeading,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: Divider(
                thickness: 1,
                height: 1,
                color: AppColors.stroke,
              ),
            ),
            BoletoListWidget(controller: controller)
          ],
        ),
      ),
    );
  }
}
