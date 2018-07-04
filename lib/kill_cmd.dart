import 'dart:async';
import 'dart:io';
import 'package:process_run/cmd_run.dart';
import 'package:tekartik_cmd_utils/src/ps.dart';

Future killCommand(String name) async {
  ProcessCmd cmd = new ProcessCmd("ps", ["x", "-o", "pid,cmd"]);

  ProcessResult processResult = await runCmd(cmd, commandVerbose: true);
  PsParser psParser = new PsParser(processResult.stdout.toString());
  List<PsLine> lines = psParser.findByCmd(name);
  if (lines.isEmpty) {
    stderr.writeln("*${name}* process not found");
  } else {
    for (PsLine line in lines) {
      print(line);
      ProcessCmd cmd = new ProcessCmd("kill", ["-9", "${line.pid}"]);
      await runCmd(cmd, verbose: true);
    }
  }
}
