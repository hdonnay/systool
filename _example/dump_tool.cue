package main

command: dump: task: print: cli.Print & {
	text: script.compiled
}
