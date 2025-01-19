#! /usr/bin/env dcli

import "package:modulr/src/module_generator.dart";
import "package:modulr/src/utilities/utils.dart";

void main(List<String> args) async {
  ModuleGenerator moduleGenerator = ModuleGenerator(args);
  await moduleGenerator.generate();
  Utils.formatGeneratedCode();
}
