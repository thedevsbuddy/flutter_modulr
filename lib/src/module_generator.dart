import 'package:dcli/dcli.dart';
import 'package:modulr/src/base_generator.dart';

import 'package:modulr/module/module.dart' as modulr_module;
import 'package:modulr/module/routes/router.dart' as modulr_router;
import 'package:modulr/src/controller_generator.dart';
import 'package:modulr/src/page_generator.dart';
import 'package:modulr/src/service_generator.dart';
import 'utilities/utils.dart';

class ModuleGenerator extends BaseGenerator {
  ModuleGenerator(super.args);

  Future<void> generate() async {
    // Controller
    ControllerGenerator controllerGenerator = ControllerGenerator(args);
    await controllerGenerator.generate();

    // Service
    ServiceGenerator serviceGenerator = ServiceGenerator(args);
    await serviceGenerator.generate();

    // Page
    PageGenerator pageGenerator = PageGenerator(args);
    await pageGenerator.generate();

    // Routes
    await generateRoute();

    // Module
    await generateModuleClass();
  }

  Future<void> generateModuleClass() async {
    /// Check and create directory
    Utils.makeDir(modulePath);

    String moduleFile = modulr_module.stub.replaceAll('{SNAKE_MODULE}', moduleName.snakeCase);
    moduleFile = moduleFile.replaceAll('{MODULE}', moduleName.pascalCase);

    /// Write File
    Utils.writeFile("$modulePath/${moduleName.snakeCase}_module.dart", moduleFile);

    /// Show Success message
    print(green('"$modulePath/${moduleName.snakeCase}_module.dart" generated successfully!'));
  }

  Future<void> generateRoute() async {
    /// Check and create directory
    Utils.makeDir(routePath);

    /// Process Router File
    String routeFile = modulr_router.stub.replaceAll('{MODULE}', moduleName.pascalCase);
    routeFile = routeFile.replaceAll('{SNAKE_MODULE}', moduleName.snakeCase);
    routeFile = routeFile.replaceAll('{MODULE_URL}', moduleName.paramCase);
    routeFile = routeFile.replaceAll('{CAMEL_MODULE}', moduleName.camelCase);
    routeFile = routeFile.replaceAll('{MODULE_URL_CAMEL}', moduleName.camelCase);

    /// Write File
    Utils.writeFile("$routePath/${moduleName.snakeCase}_router.dart", routeFile);

    /// Show Success message
    print(green('"$routePath/${moduleName.snakeCase}_router.dart" generated successfully!'));
  }
}
