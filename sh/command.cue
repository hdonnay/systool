package sh

import "strings"

Command: {
	_eval: string
}

Arg: string | {output: string}

Redirect: {
	r:  ">" | ">>" | "<"
	to: string

	output: "\(r)\(to)"
}

Cmd: Command & {
	exe: string
	argv: [...Arg]
	redir: *"" | Redirect
	_eval: "\(exe) \(_compiled)\(redir.output | (redir & string))"

	_compiled = strings.Join([ a.output | (a & string) for a in argv ], " ")
}
