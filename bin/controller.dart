#! /usr/bin/env dcli

import "package:modulr/src/controller_generator.dart";
import "package:modulr/src/utilities/utils.dart";

void main(List<String> args) async {
  ControllerGenerator controllerGenerator = ControllerGenerator(args);
  await controllerGenerator.generate(true);
  Utils.formatGeneratedCode();
}
