#! /usr/bin/env dcli

import "package:modulr/src/controller_generator.dart";

void main(List<String> args) {
  ControllerGenerator controllerGenerator = ControllerGenerator(args);
  controllerGenerator.generate(true);
}
