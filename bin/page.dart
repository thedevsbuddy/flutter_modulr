#! /usr/bin/env dcli

import "package:modulr/src/page_generator.dart";

void main(List<String> args) {
  PageGenerator pageGenerator = PageGenerator(args);
  pageGenerator.generate(true);
}
