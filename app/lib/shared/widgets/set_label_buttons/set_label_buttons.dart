import 'package:app/shared/themes/app_colors.dart';
import 'package:app/shared/themes/app_text_styles.dart';
import 'package:app/shared/widgets/divider_vertical/divider_vertical.dart';
import 'package:app/shared/widgets/label_button/label_button.dart';
import 'package:flutter/material.dart';

class SetLabelButtons extends StatelessWidget {
  final String primaryLabel;
  final VoidCallback primaryOnPressed;
  final String secondaryLabel;
  final VoidCallback secondaryOnPressed;
  final bool enablePrimaryColor;
  final bool enableSecondaryColor;

  const SetLabelButtons(
      {Key? key,
      required this.primaryLabel,
      required this.primaryOnPressed,
      required this.secondaryLabel,
      required this.secondaryOnPressed,
      this.enablePrimaryColor = false,
      this.enableSecondaryColor = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      height: 57,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(
            thickness: 1,
            height: 1,
            color: AppColors.stroke,
          ),
          SizedBox(
            height: 56,
            child: Row(
              children: [
                Expanded(
                    child: LabelButton(
                        style: enablePrimaryColor
                            ? TextStyles.buttonPrimary
                            : null,
                        label: primaryLabel,
                        onPressed: primaryOnPressed)),
                const DividerVerticalWidget(),
                Expanded(
                    child: LabelButton(
                        style: enableSecondaryColor
                            ? TextStyles.buttonPrimary
                            : null,
                        label: secondaryLabel,
                        onPressed: secondaryOnPressed)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
