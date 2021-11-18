import 'package:app/shared/models/user_model.dart';
import 'package:flutter/material.dart';

import '../../shared/themes/app_colors.dart';
import '../../shared/themes/app_text_styles.dart';
import '../../shared/widgets/extract/extract_page.dart';
import '../../shared/widgets/meus_boletos/meus_boletos_page.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final UserModel user;
  const HomePage({Key? key, required this.user}) : super(key: key);

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
                          text: "${widget.user.name}",
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
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(image: NetworkImage(widget.user.photoURL!))
                      ),
                      
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
