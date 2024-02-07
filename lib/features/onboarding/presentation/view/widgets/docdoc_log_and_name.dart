import 'package:docdoc/core/extensions/gap.dart';
import 'package:docdoc/core/themes/styles.dart';
import 'package:docdoc/core/utils/svgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DocDocLogoAndName extends StatelessWidget {
  const DocDocLogoAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(Svgs.logo),
        10.pw,
        Text(
          "Docdoc",
          style: TextStyles.font24Black700Weight,
        ),
      ],
    );
  }
}
