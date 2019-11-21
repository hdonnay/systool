package main

import "tool/exec"

command: run: {
	task: run: exec.Run & {
		cmd:   "sh"
		stdin: script.compiled
	}
}
