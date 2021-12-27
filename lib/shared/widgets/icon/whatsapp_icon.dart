import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget whatsAppIcon() {
  return SvgPicture.asset(
    'assets/icons/whatsapp.svg',
    height: 24,
    width: 24,
  );
}

Widget whatsAppFilledIcon() {
  return SvgPicture.asset(
    'assets/icons/whatsappFilled.svg',
    height: 24,
    width: 2,
  );
}
