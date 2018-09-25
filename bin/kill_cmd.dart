#!/usr/bin/env bash
library tekartik_script.bin.kill_cmd;

import 'package:tekartik_cmd_utils/bin/kill_cmd.dart' as _;

// example
// windows:
// dart .\bin\kill_cmd.dart qemu-system-i386.exe
main(List<String> arguments) => _.main(arguments);
