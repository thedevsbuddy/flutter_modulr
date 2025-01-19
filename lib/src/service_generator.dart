import 'package:dcli/dcli.dart';
import 'package:modulr/module/services/api_module_service.dart' as modulr_api_service;
import 'package:modulr/module/services/local_module_service.dart' as modulr_local_service;
import 'package:modulr/module/services/module_service.dart' as modulr_service;

import 'base_generator.dart';
import 'utilities/utils.dart';

class ServiceGenerator extends BaseGenerator {
  ServiceGenerator(super.args);

  Future<void> generate() async {
    /// Generate Controller
    Utils.makeDir(servicePath);

    /// Replace slots with actual value
    String serviceFile = modulr_service.stub.replaceAll('{MODULE}', serviceName.pascalCase);
    serviceFile = serviceFile.replaceAll('{SNAKE_MODULE}', serviceName.snakeCase);
    String serviceLocalFile = modulr_local_service.stub.replaceAll('{MODULE}', serviceName.pascalCase);
    serviceLocalFile = serviceLocalFile.replaceAll('{SNAKE_MODULE}', serviceName.snakeCase);
    serviceLocalFile = serviceLocalFile.replaceAll('{PLURAL_MODULE}', Utils.pluralize(serviceName.snakeCase));
    String serviceApiFile = modulr_api_service.stub.replaceAll('{MODULE}', serviceName.pascalCase);
    serviceApiFile = serviceApiFile.replaceAll('{SNAKE_MODULE}', serviceName.snakeCase);

    /// Write File
    Utils.writeFile("$servicePath/${serviceName.snakeCase}_service.dart", serviceFile);
    Utils.writeFile("$servicePath/local_${serviceName.snakeCase}_service.dart", serviceLocalFile);
    Utils.writeFile("$servicePath/api_${serviceName.snakeCase}_service.dart", serviceApiFile);

    /// Show Success message
    print(green('"$servicePath/${serviceName.snakeCase}_service.dart" generated successfully.'));
    print(green('"$servicePath/local_${serviceName.snakeCase}_service.dart" generated successfully.'));
    print(green('"$servicePath/api_${serviceName.snakeCase}_service.dart" generated successfully.'));
  }
}
