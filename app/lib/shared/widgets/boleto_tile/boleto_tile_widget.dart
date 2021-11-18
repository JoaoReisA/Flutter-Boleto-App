import 'package:app/shared/models/boleto_model.dart';
import 'package:app/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

class BoletoTileWidget extends StatelessWidget {
  final BoletoModel data;
  const BoletoTileWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(data.name!),
      subtitle: Text(
        "Vence em ${data.dueDate}",
        style: TextStyles.titleListTile,
      ),
      trailing: Text.rich(TextSpan(
        text: "R\$ ",
        style: TextStyles.trailingRegular,
        children: [
          TextSpan(
            text: "${data.value!.toStringAsFixed(2)}",
            style: TextStyles.trailingBold,
          ),
        ],
      )),
    );
  }
}
