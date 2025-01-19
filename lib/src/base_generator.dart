import 'package:recase/recase.dart';

class BaseGenerator {
  List<String> args = [];

  /// ReCase properties
  ReCase moduleName = ReCase("");
  ReCase controllerName = ReCase("");
  ReCase viewName = ReCase("");
  ReCase serviceName = ReCase("");

  /// String properties
  String modulePath = "";
  String modelPath = "";
  String controllerPath = "";
  String servicePath = "";
  String viewPath = "";
  String routePath = "";
  String baseRoutePath = "";

  BaseGenerator(this.args) {
    moduleName = ReCase(args.first);
    controllerName = moduleName;
    viewName = moduleName;
    serviceName = moduleName;

    modulePath = "lib/app/modules/${moduleName.snakeCase}";
    modelPath = "lib/app/models";
    baseRoutePath = "lib/routes";
    controllerPath = "lib/app/modules/${moduleName.snakeCase}/controllers";
    servicePath = "lib/app/modules/${moduleName.snakeCase}/services";
    viewPath = "lib/app/modules/${moduleName.snakeCase}/views";
    routePath = "lib/app/modules/${moduleName.snakeCase}/routes";
  }
}
