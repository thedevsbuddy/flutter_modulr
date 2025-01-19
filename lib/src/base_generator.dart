import 'package:recase/recase.dart';

import 'utilities/utils.dart';

class BaseGenerator {
  List<String> args = [];

  Map<String, String> replaceables = {};

  /// ReCase properties
  ReCase moduleName = ReCase("");
  ReCase controllerName = ReCase("");
  ReCase pageName = ReCase("");

  /// String properties
  String modulePath = "";
  String modulesPath = "";
  String modelPath = "";
  String controllerPath = "";
  String servicePath = "";
  String pagePath = "";
  String routePath = "";
  String baseRoutePath = "";

  BaseGenerator(this.args) {
    moduleName = ReCase(args.first);
    controllerName = moduleName;
    pageName = moduleName;

    modulesPath = "lib/app/modules";
    modulePath = "$modulesPath/${moduleName.snakeCase}";
    modelPath = "lib/app/models";
    baseRoutePath = "lib/routes";
    controllerPath = "lib/app/modules/${moduleName.snakeCase}/controllers";
    servicePath = "lib/app/modules/${moduleName.snakeCase}/services";
    pagePath = "lib/app/modules/${moduleName.snakeCase}/views";
    routePath = "lib/app/modules/${moduleName.snakeCase}/routes";
  }

  String parseStub(String stub) {
    replaceables = {
      '{CONTROLLER}': controllerName.pascalCase,
      '{SNAKE_CONTROLLER}': controllerName.snakeCase,
      '{MODULE}': moduleName.pascalCase,
      '{CAMEL_MODULE}': moduleName.camelCase,
      '{SNAKE_MODULE}': moduleName.snakeCase,
      '{PLURAL_MODULE}': Utils.pluralize(moduleName.snakeCase),
      '{MODULE_URL}': moduleName.paramCase,
      '{MODULE_URL_CAMEL}': moduleName.camelCase,
      '{PAGE}': pageName.pascalCase,
    };

    String file = stub;
    for (String key in replaceables.keys) {
      file = file.replaceAll(key, replaceables[key]!);
    }
    return file;
  }
}
