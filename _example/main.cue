package main

import "github.com/hdonnay/systool/cmd"

OK = cmd.msg & {msg: "OK"}
hostname = cmd.dstring & {value: "$(hostname)"}
print_hostname = cmd.msg & { msg: "hostname is: $(hostname)"}

script: cmd.script & {
	_cmds: [
		cmd.msg & {msg: ["hello, $USER"]},
		print_hostname,
		cmd.cond & {
			test: cmd.test & {test: [hostname, "=", "rot"]}
			body: [OK]
		},
		cmd.switch & {
			test: hostname
			case: toolbox: [OK]
		},
	]
}
