import 'package:ansicolor/ansicolor.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'app/utils/loader.dart';
import 'cripton_erp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  configLoader();
  ansiColorDisabled = false;
  runApp(
    const CriptonERP(),
  );
}
