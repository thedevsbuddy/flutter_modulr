const String stub = """
import 'package:get/get.dart';

import '../{SNAKE_MODULE}_module.dart';

List<GetPage> {CAMEL_MODULE}Routes = [
  GetPage(name: '/{MODULE_URL}', page: () => {MODULE}Page()),
];
""";
