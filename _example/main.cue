package main

import "github.com/hdonnay/systool/sh"

OK = sh.Msg & {msg: "OK"}
hostname = sh.dq & {value: "$(hostname)"}
print_hostname = sh.Msg & {msg: sh.dq & { value: "hostname is: $(hostname)"} }

script: sh.Script & {
	cmds: [
		sh.Msg & {msg: sh.dq &{ value: "hello, $USER" }},
		print_hostname,
		sh.Cond & {
			test: sh.Cmd & {
				exe: "test"
				argv: [hostname, "=", "rot"]
			}
			body: OK
		},
		sh.Switch & {
			test: hostname,
			case: toolbox: [OK]
		},
	]
}
