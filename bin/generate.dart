#! /usr/bin/env dcli

import "dart:io";

import "package:dcli/dcli.dart";
import "package:modulr/src/module_generator.dart";

void main(List<String> args) async {
  ModuleGenerator moduleGenerator = ModuleGenerator(args);
  await moduleGenerator.generate();
  formatGeneratedCode();
}

void formatGeneratedCode() async {
  print(blue('Formatting Generated Code....'));
  try {
    final moduleResult = await Process.run('dart', ['format', 'lib/app']);
    if (moduleResult.exitCode == 0) {
      print(blue(moduleResult.stdout));
    } else {
      print(red('Command failed with error code ${moduleResult.exitCode}: ${moduleResult.stderr}'));
    }

    print(blue('Formatting Generated Code....'));
    final routeResult = await Process.run('dart', ['format', 'lib/routes']);
    if (routeResult.exitCode == 0) {
      print(blue(routeResult.stdout));
    } else {
      print(red('Command failed with error code ${routeResult.exitCode}: ${routeResult.stderr}'));
    }
  } catch (e) {
    print(red('Error running command: $e'));
  }
}
