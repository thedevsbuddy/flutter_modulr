#! /usr/bin/env dcli

import "package:modulr/src/module_generator.dart";

void main(List<String> args) {
  ModuleGenerator moduleGenerator = ModuleGenerator(args);
  moduleGenerator.generate();
}
