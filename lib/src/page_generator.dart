import 'package:dcli/dcli.dart';
import 'package:modulr/module/views/module_page.dart' as modulr_page;
import 'package:recase/recase.dart';

import 'base_generator.dart';
import 'utilities/utils.dart';

class PageGenerator extends BaseGenerator {
  PageGenerator(super.args);

  Future<void> generate([bool single = false]) async {
    /// Validate arguments
    if (single) {
      if (!_validateArgs(args)) return;
    }

    /// Get stub
    String stub = modulr_page.stub;

    /// Generate Controller
    Utils.makeDir(pagePath);

    /// Replace slots with actual value
    String viewFile = parseStub(stub);

    /// Write File
    Utils.writeFile(
      "$pagePath/${pageName.snakeCase}_page.dart",
      viewFile,
    );

    /// Show Success message
    print(green('"$pagePath/${pageName.snakeCase}_page.dart" generated successfully.'));

    /// Update module export to add the new page
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

    // Assign view path for the module
    pagePath = "lib/app/modules/${moduleName.snakeCase}/views";
    modulePath = "lib/app/modules/${moduleName.snakeCase}";

    /// Assign variable values
    pageName = ReCase(args.first);
    String? rawpageName = pageName.originalText;
    rawpageName.toLowerCase().replaceAll('page', "");
    pageName = ReCase(rawpageName);

    return true;
  }

  Future<void> updateModuleExport() async {
    String exportFile = "views/${pageName.snakeCase}_page.dart";
    String moduleFilePath = "$modulePath/${moduleName.snakeCase}_module.dart";
    String moduleFileContent = await Utils.readFile(moduleFilePath);
    if (moduleFileContent.contains(exportFile)) {
      /// Show Success message
      print(yellow('`export "${pageName.snakeCase}_page.dart"` already exists in $moduleFilePath'));
      return;
    }
    moduleFileContent = """
      $moduleFileContent
      export '$exportFile';
    """;

    /// Write File
    Utils.writeFile(moduleFilePath, moduleFileContent);

    /// Show Success message
    print(green('Added `export "${controllerName.snakeCase}_page.dart"` to `$moduleFilePath`'));
  }
}
