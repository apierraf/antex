import 'package:antex/pages/notificaciones/notificaciones_page.dart';
import 'package:antex/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/nav_icons.dart';
import '../home/home_page.dart';
import '../notificaciones/notificaciones_controller.dart';
import '../widgets/menu_modal.dart';
import 'dashboard_controller.dart';
import 'package:badges/badges.dart';

class DashBoardPage extends StatelessWidget {
  DashBoardPage({Key? key}) : super(key: key);

  final NotificacionesController controller1 =
      Get.put(NotificacionesController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardController>(
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: [
                HomePage(),
                NotificacionesPage(),
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            heroTag: null,
            onPressed: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  context: context,
                  builder: (context) {
                    return MenuModal();
                  });
            },
            elevation: 6,
            backgroundColor: kColorApp,
            child: const FaIcon(
              Icons.menu,
              color: Colors.white,
            ),
          ),
          bottomNavigationBar: AnimatedBottomNavigationBar.builder(
            itemCount: 2,
            activeIndex: controller.tabIndex,
            onTap: (index) => controller.changeTabIndex(index),
            backgroundColor: Colors.white,
            notchSmoothness: NotchSmoothness.defaultEdge,
            gapLocation: GapLocation.center,
            rightCornerRadius: 20,
            leftCornerRadius: 20,
            tabBuilder: (int index, bool isActive) {
              final color = isActive ? kColorApp : Colors.grey;
              return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Badge(
                    showBadge: badgeList[index] == 0 ? false : true,
                    //badgeContent: Text('${_controller.eventosList.length}'),
                    badgeContent: Text(
                      '1',
                      style: TextStyle(color: Colors.white),
                    ),
                    badgeColor: kColorApp,

                    child: Icon(
                      iconList[index],
                      size: 30,
                      color: color,
                    ),
                  )
                ],
              );
            },
          ),
        );
      },
    );
  }
}
