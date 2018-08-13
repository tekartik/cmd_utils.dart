#!/bin/bash

# Fast fail the script on failures.
set -e

dartanalyzer --fatal-warnings bin lib test

pub run test -p vm