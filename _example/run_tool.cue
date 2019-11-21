package main

command: run: task: run: exec.Run & {
	cmd:   "/bin/sh"
	stdin: script.compiled
}
