import 'package:docdoc/core/di/dependency_injection.dart';
import 'package:docdoc/docdoc_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await initGetIt();
  runApp(const DocDocApp());
}
