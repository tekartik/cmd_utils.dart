import 'dart:async';
import 'dart:io';
import 'package:process_run/cmd_run.dart';
import 'package:tekartik_cmd_utils/src/process_win.dart';
import 'package:tekartik_cmd_utils/src/ps.dart';

Future killCommand(String name) async {
  return await killAllCommandsByName(name);
}

// dart.exe,
Future<int> killAllCommandsByName(String name) async {
  if (Platform.isWindows) {
    var pids = await getProcessIds(name);
    for (var pid in pids) {
      await killProcess(pid);
    }
    return pids.length;
  } else {
    ProcessCmd cmd = ProcessCmd("ps", ["x", "-o", "pid,cmd"]);

    ProcessResult processResult = await runCmd(cmd, commandVerbose: true);
    PsParser psParser = PsParser(processResult.stdout.toString());
    List<PsLine> lines = psParser.findByCmd(name);
    for (PsLine line in lines) {
      print(line);
      ProcessCmd cmd = ProcessCmd("kill", ["-9", "${line.pid}"]);
      await runCmd(cmd, verbose: true);
    }

    return lines.length;
  }
}
