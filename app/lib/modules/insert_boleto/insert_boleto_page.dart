import 'package:app/shared/themes/app_colors.dart';
import 'package:app/shared/themes/app_text_styles.dart';
import 'package:app/shared/widgets/input_text/input_text_widget.dart';
import 'package:app/shared/widgets/set_label_buttons/set_label_buttons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InsertBoletoPage extends StatelessWidget {
  const InsertBoletoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.background,
          elevation: 0,
          leading: const BackButton(color: AppColors.input),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 93, vertical: 43),
              child: Text(
                "Preencha os dados do boleto",
                style: TextStyles.titleBoldHeading,
                textAlign: TextAlign.center,
              ),
            ),
            InputTextWidget(
              label: "Nome do boleto",
              icon: Icons.description_outlined,
              onChanged: (value) {},
            ),
            InputTextWidget(
              label: "Vencimento ",
              icon: FontAwesomeIcons.timesCircle,
              onChanged: (value) {},
            ),
            InputTextWidget(
              label: "Valor",
              icon: FontAwesomeIcons.wallet,
              onChanged: (value) {},
            ),
            InputTextWidget(
              label: "Código",
              icon: FontAwesomeIcons.barcode,
              onChanged: (value) {},
            ),
          ],
        ),
        bottomNavigationBar: SetLabelButtons(primaryLabel: "cancelar", primaryOnPressed: (){}, secondaryLabel: "Cadastrar", secondaryOnPressed: (){}, enableSecondaryColor:true),
        );
  }
}
