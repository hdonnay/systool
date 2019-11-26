package sh

Err :: Scope & {
	// Msg is the message to be printed to stderr.
	msg: Arg

	list: [
		Cmd & {
			exe:   "printf"
			redir: Redirect & {r: ">", to: "&2"}
			argv: ["'! %s\\n'", "\(_msg)"]
		},
		Cmd & {
			exe: "exit"
			argv: ["1"]
		},
	]

	_msg: (msg & string | msg.output)
}

Msg :: Cmd & {
	// Msg is the message to be printed to stdout.
	msg: Arg

	exe: "printf"
	argv: ["': %s\\n'", "\(_msg)"]

	_msg: (msg & string | msg.output)
}
