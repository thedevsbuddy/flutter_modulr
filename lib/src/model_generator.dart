import 'package:dcli/dcli.dart';
import 'package:modulr/module/models/model.dart' as modulr_model;
import 'package:modulr/src/base_generator.dart';

import 'utilities/utils.dart';

class ModelGenerator extends BaseGenerator {
  ModelGenerator(super.args);

  Future<void> generate() async {
    await generateModel();
    await updateModelsExport();
  }

  Future<void> generateModel() async {
    /// Check and create directory
    Utils.makeDir(modelPath);

    String modelFile = modulr_model.stub.replaceAll('{MODULE}', moduleName.pascalCase);

    /// Write File
    Utils.writeFile("$modelPath/${moduleName.snakeCase}_model.dart", modelFile);

    /// Show Success message
    print(green('"$modelPath/${moduleName.snakeCase}_model.dart" generated successfully!'));
  }

  Future<void> updateModelsExport() async {
    String exportFile = "${moduleName.snakeCase}_model.dart";
    String modelsFilePath = "$modelPath/models.dart";
    String modelsFileContent = await Utils.readFile(modelsFilePath);
    if (modelsFileContent.contains(exportFile)) {
      /// Show Success message
      print(green('export "${moduleName.snakeCase}_model.dart" already exists in $modelsFilePath'));
      return;
    }
    modelsFileContent = """
      $modelsFileContent
      export '$exportFile';
    """;

    /// Write File
    Utils.writeFile(modelsFilePath, modelsFileContent);

    /// Show Success message
    print(green('export "${moduleName.snakeCase}_model.dart" added to $modelsFilePath'));
  }
}
