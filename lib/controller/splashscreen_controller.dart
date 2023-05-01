import 'package:crimityapp/controller/splashscreen_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';

import 'model/model_splashscreen.dart';

class SplashScreenController extends GetxController{

  final controller = LiquidController();
  RxInt currentPage = 0.obs;


  final pages = [
    SplashScreenWidget(
      model: SplashScreenModel(
        image: 'assets/imgs/splash1.PNG',
        title: 'Mantente alerta',
        subtitle: 'con Crimity',
        counterText: '1/3',
        bgcolor: Colors.white,
      ),
    ),
    SplashScreenWidget(
      model: SplashScreenModel(
        image: 'assets/imgs/splash2.PNG',
        title: 'Graficos estadisticos',
        subtitle: 'certeros a base de datos reales',
        counterText: '2/3',
        bgcolor: Color(0xFFFCDCBC),
      ),
    ),
    SplashScreenWidget(
      model: SplashScreenModel(
        image: 'assets/imgs/splash3.PNG',
        title: 'Registra los',
        subtitle: 'delitos cercanos a ti',
        counterText: '3/3',
        bgcolor: Color(0xFFDEFBFF),
      ),
    ),
  ];


  animateToNextSlide() {
    int nextPage = controller.currentPage + 1;
    controller.animateToPage(page: nextPage);
  }
  onPageChangedCallback(int activePageIndex) => currentPage.value = activePageIndex;
}