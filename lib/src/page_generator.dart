import 'package:dcli/dcli.dart';
import 'package:modulr/module/views/module_page.dart'
as modulr_page;
import 'package:modulr/module/views/module_single_page.dart'
as modulr_single_page;
import 'package:recase/recase.dart';

import 'base_generator.dart';
import 'utilities/utils.dart';

class PageGenerator extends BaseGenerator {
  PageGenerator(super.args);

  Future<void> generate([bool single = false]) async {
    /// Validate arguments
    if(single){
      if (!_validateArgs(args)) return;
    }

    /// Get stub
    String stub = single ? modulr_single_page.stub : modulr_page.stub;
    /// Generate Controller
    Utils.makeDir(viewPath);

    /// Replace slots with actual value
    String viewFile = stub.replaceAll('{PAGE}', viewName.pascalCase);
    viewFile = viewFile.replaceAll('{MODULE}', moduleName.pascalCase);
    viewFile = viewFile.replaceAll('{SNAKE_MODULE}', moduleName.snakeCase);

    /// Write File
    Utils.writeFile(
      "$viewPath/${viewName.snakeCase}_page.dart",
      viewFile,
    );

    /// Show Success message
    print(green(
        '"$viewPath/${viewName.snakeCase}_page.dart" generated successfully.'));
  }

  bool _validateArgs(List<String> args) {
    /// Check if there are any args
    if (args.isEmpty) {
      print(red(
          'Please provide controller name and module name\nExample "dart pub run modulr:controller ControllerName --on=module_name"'));
      return false;
    }

    /// Get the module name
    String onModule = args.where((element) => element.contains('--on=')).isNotEmpty
        ? args.where((element) => element.contains('--on=')).first
        : "";

    /// Check if the module name is provided or not.
    if (onModule == "") {
      print(red(
          'Please provide module name to generate the controller\nExample [--on=<module_name>]'));
      return false;
    }

    /// Assign module name
    moduleName = ReCase(onModule.replaceAll('--on=', ''));

    // Assign controller path for the module
    viewPath = "lib/app/modules/${moduleName.snakeCase}/views";

    /// Assign variable values
    viewName = ReCase(args.first);

    return true;
  }
}
