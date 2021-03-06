#!/usr/bin/env bash

library tekartik_script.bin.kill_cmd;

import 'dart:async';

import 'package:tekartik_cmd_utils/bin/kill_cmd.dart' as kill_cmd;

// example
// windows:
// dart .\bin\kill_cmd.dart qemu-system-i386.exe
Future main(List<String> arguments) => kill_cmd.main(arguments);
