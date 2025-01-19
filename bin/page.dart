#! /usr/bin/env dcli

import "package:modulr/src/controller_generator.dart";
import "package:modulr/src/page_generator.dart";
import "package:modulr/src/utilities/utils.dart";

void main(List<String> args) async {
  PageGenerator pageGenerator = PageGenerator(args);
  await pageGenerator.generate(true);

  ControllerGenerator controllerGenerator = ControllerGenerator(args);
  await controllerGenerator.generate(true);
  Utils.formatGeneratedCode();
}
