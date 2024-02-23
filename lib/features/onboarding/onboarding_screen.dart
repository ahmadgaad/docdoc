import 'package:docdoc/core/themes/styles.dart';
import 'package:docdoc/features/onboarding/components/docdoc_log_and_name.dart';
import 'package:docdoc/features/onboarding/components/doctor_image_and_text.dart';
import 'package:docdoc/features/onboarding/components/get_started_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 30.h),
            child: Column(
              children: [
                const DocDocLogoAndName(),
                30.verticalSpace,
                const DoctorImageAndText(),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                    start: 23.w,
                    end: 23.w,
                    top: 20.h,
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.",
                        textAlign: TextAlign.center,
                        style: TextStyles.font13GreyRegular,
                      ),
                      30.verticalSpace,
                      const GetStartedButton(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
