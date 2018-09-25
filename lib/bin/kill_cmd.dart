#!/usr/bin/env dart
// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:io';

import 'package:args/args.dart';
import 'package:tekartik_cmd_utils/kill_cmd.dart';

const String _FLAG_HELP = 'help';
const String scriptName = "kill_cmd";

main(List<String> args) async {
  var parser = ArgParser();

  parser.addFlag(_FLAG_HELP, abbr: 'h', help: 'Usage help', negatable: false);

  var results = parser.parse(args);

  parser.parse(args);

  bool help = results[_FLAG_HELP];

  _usage() {
    print(
        "${scriptName} <part_of_process_name> [<other_part_of_process_name> ...]");
    print(parser.usage);
  }

  if (help) {
    _usage();
    return;
  }

  if (results.rest.length == 0) {
    _usage();
    exit(1);
  }

  for (String name in results.rest) {
    int count = await killAllCommandsByName(name);
    if (count == 0) {
      stderr.writeln("*${name}* process not found");
    } else {
      stdout.writeln('$count process killed');
    }
  }
}
