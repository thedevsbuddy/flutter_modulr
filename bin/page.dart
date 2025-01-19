#! /usr/bin/env dcli

import "package:modulr/src/page_generator.dart";
import "package:modulr/src/utilities/utils.dart";

void main(List<String> args) async {
  PageGenerator pageGenerator = PageGenerator(args);
  await pageGenerator.generate(true);
  Utils.formatGeneratedCode();
}
