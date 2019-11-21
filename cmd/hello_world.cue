package hello

import (
	"github.com/hdonnay/systool/cmd"
)

OK = cmd.msg&{msg: "OK"}
hostname = cmd.dstring&{value:"$(hostname)"}

script:: cmd.script&{
	//_debug: true
	_cmds: [
		cmd.msg & {msg: "$USER"},
		cmd.cond&{
			test: cmd.test&{test: [hostname, "=", "rot"]}
			body: [ OK ]
		},
		cmd.switch&{
			test: hostname
			case: toolbox: [OK]
		}
	]
}
