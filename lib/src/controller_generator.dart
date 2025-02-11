import 'package:dcli/dcli.dart';
import 'package:modulr/module/controllers/module_controller.dart' as modulr_controller;
import 'package:modulr/module/controllers/module_single_controller.dart' as modulr_single_controller;
import 'package:recase/recase.dart';

import 'base_generator.dart';
import 'utilities/utils.dart';

class ControllerGenerator extends BaseGenerator {
  ControllerGenerator(super.args);

  Future<void> generate([bool single = false]) async {
    /// Validate arguments
    if (single) {
      if (!_validateArgs(args)) return;
    }

    /// Get stub
    String stub = single ? modulr_single_controller.stub : modulr_controller.stub;

    /// Generate Controller
    Utils.makeDir(controllerPath);

    /// Replace slots with actual value
    String controllerFile = parseStub(stub);

    /// Write File
    Utils.writeFile(
      "$controllerPath/${controllerName.snakeCase}_controller.dart",
      controllerFile,
    );

    /// Show Success message
    print(green('"$controllerPath/${controllerName.snakeCase}_controller.dart" generated successfully.'));

    /// Update module export to add the new controller
    if (single) {
      await updateModuleExport();
    }
  }

  bool _validateArgs(List<String> args) {
    /// Check if there are any args
    if (args.isEmpty) {
      print(red('Please provide controller name and module name\nExample "dart pub run modulr:controller ControllerName --on=module_name"'));
      return false;
    }

    /// Get the module name
    String onModule = args.where((element) => element.contains('--on=')).isNotEmpty ? args.where((element) => element.contains('--on=')).first : "";

    /// Check if the module name is provided or not.
    if (onModule == "") {
      print(red('Please provide module name to generate the controller\nExample [--on=<module_name>]'));
      return false;
    }

    /// Assign module name
    moduleName = ReCase(onModule.replaceAll('--on=', ''));

    // Assign controller path for the module
    controllerPath = "lib/app/modules/${moduleName.snakeCase}/controllers";
    modulePath = "lib/app/modules/${moduleName.snakeCase}";

    /// Assign variable values
    controllerName = ReCase(args.first);

    return true;
  }

  Future<void> updateModuleExport() async {
    String exportFile = "controllers/${controllerName.snakeCase}_controller.dart";
    String moduleFilePath = "$modulePath/${moduleName.snakeCase}_module.dart";
    String moduleFileContent = await Utils.readFile(moduleFilePath);
    if (moduleFileContent.contains(exportFile)) {
      /// Show Success message
      print(yellow('`export "${controllerName.snakeCase}_controller.dart"` already exists in $moduleFilePath'));
      return;
    }
    moduleFileContent = """
      $moduleFileContent
      export '$exportFile';
    """;

    /// Write File
    Utils.writeFile(moduleFilePath, moduleFileContent);

    /// Show Success message
    print(green('Added `export "${controllerName.snakeCase}_controller.dart"` to `$moduleFilePath`'));
  }
}
