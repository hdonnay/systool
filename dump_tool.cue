package main

import "tool/cli"

command: dump: {
	task: print: cli.Print & {
		text: script.compiled
	}
}
