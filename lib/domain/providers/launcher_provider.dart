import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LauncherProvider extends ChangeNotifier {
  bool isVisible = false;

  //menu
  void activeMenu() {
    (isVisible == false) ? (isVisible = true) : (isVisible = false);
    notifyListeners();
  }

  //email
  void goEmailLauncher() async {
    String email = 'buscappme@gmail.com';
    String asunto = 'Solicito informacion';
    String msg = 'Deseo mas detalles';

    String urlEncode =
        Uri.decodeFull('mailto:$email?subject=$asunto&body=$msg');
    if (await canLaunchUrlString(urlEncode)) {
      await launchUrlString(
        urlEncode,
        mode: LaunchMode.externalApplication,
      );
    }
  }

  //phone
  void goPhoneLauncher() async {
    String phone = '+51947278925';
    String url = 'tel:$phone';

    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    }
  }

  //wsp
  void goWhatsappLauncher() async {
    String phone = '+51947278925';
    String msg = 'Quiero saber de BuscAppme';
    String urlEncode = Uri.decodeFull('https://wa.me/$phone?text=$msg');

    if (await canLaunchUrlString(urlEncode)) {
      await launchUrlString(
        urlEncode,
        mode: LaunchMode.externalApplication,
      );
    }
  }
}
