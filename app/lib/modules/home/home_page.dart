import 'package:app/modules/home/home_controller.dart';
import 'package:app/shared/models/boleto_model.dart';
import 'package:app/shared/themes/app_colors.dart';
import 'package:app/shared/themes/app_text_styles.dart';
import 'package:app/shared/widgets/boleto_list/boleto_list_widget.dart';
import 'package:app/shared/widgets/boleto_tile/boleto_tile_widget.dart';
import 'package:app/shared/widgets/extract/extract_page.dart';
import 'package:app/shared/widgets/meus_boletos/meus_boletos_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = HomeController();
  final pages = [
    MeusBoletosPage(),
    ExtractPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[homeController.currentPage],
      appBar: PreferredSize(
        child: Container(
            height: 152,
            color: AppColors.primary,
            child: Center(
              child: ListTile(
                title: Text.rich(
                  TextSpan(
                      text: "Olá, ",
                      style: TextStyles.titleRegular,
                      children: [
                        TextSpan(
                          text: "João",
                          style: TextStyles.titleBoldBackground,
                        )
                      ]),
                ),
                subtitle: Text(
                  "Mantenha as suas contas em dia",
                  style: TextStyles.captionShape,
                ),
                trailing: Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
            )),
        preferredSize: const Size.fromHeight(152),
      ),
      bottomNavigationBar: SizedBox(
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  homeController.setPage(0);
                });
              },
              icon: const Icon(Icons.home),
              color: homeController.currentPage == 0
                  ? AppColors.primary
                  : AppColors.body,
            ),
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(8)),
              child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/barcode_scanner");
                },
                icon: const Icon(
                  Icons.add_box_outlined,
                  color: AppColors.background,
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  homeController.setPage(1);
                });
              },
              icon: const Icon(Icons.description_outlined),
              color: homeController.currentPage == 1
                  ? AppColors.primary
                  : AppColors.body,
            ),
          ],
        ),
      ),
    );
  }
}
