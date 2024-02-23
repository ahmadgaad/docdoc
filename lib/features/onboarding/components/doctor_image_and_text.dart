import 'package:docdoc/core/themes/styles.dart';
import 'package:docdoc/core/utils/images.dart';
import 'package:docdoc/core/utils/svgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoctorImageAndText extends StatelessWidget {
  const DoctorImageAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(Svgs.onboardingDocdocLogoLowOpacity),
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white,
                Colors.white.withOpacity(0.0),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: const [
                0.14,
                0.4,
              ],
            ),
          ),
          child: Image.asset(Images.doctor),
        ),
        PositionedDirectional(
          start: 0,
          end: 0,
          bottom: 30,
          child: Text(
            "Best Doctor\nAppointment App",
            textAlign: TextAlign.center,
            style: TextStyles.font32BlueBold.copyWith(height: 1.5),
          ),
        )
      ],
    );
  }
}
