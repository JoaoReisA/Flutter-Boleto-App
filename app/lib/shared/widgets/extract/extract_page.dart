import 'package:app/shared/models/boleto_model.dart';
import 'package:app/shared/themes/app_colors.dart';
import 'package:app/shared/themes/app_text_styles.dart';
import 'package:app/shared/widgets/boleto_info/boleto_info_widget.dart';
import 'package:app/shared/widgets/boleto_list/boleto_list_controller.dart';
import 'package:app/shared/widgets/boleto_list/boleto_list_widget.dart';
import 'package:flutter/material.dart';

class ExtractPage extends StatefulWidget {
  const ExtractPage({Key? key}) : super(key: key);

  @override
  State<ExtractPage> createState() => _ExtractPageState();
}

class _ExtractPageState extends State<ExtractPage> {
  final controller = BoletoListController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 24),
            child: Row(
              children: [
                Text(
                  "Meus extratos",
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
    );
  }
}
