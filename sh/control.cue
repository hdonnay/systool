package sh

import "strings"

ctl: Command & {
	test: Command
	body: Command | [...Command]
	ctl: {
		start: string
		then:  string
		end:   string
	}

	_eval: """
		\(ctl.start) \(test._eval); \(ctl.then)
		\(_inner)
		\(ctl.end)
		"""
	_inner = (body._eval & string) | strings.Join([ c._eval for c in body ], "\n")
}

Cond :: ctl & {
	ctl: start: "if"
	ctl: then:  "then"
	ctl: end:   "fi"
}

While :: ctl & {
	ctl: start: "while"
	ctl: then:  "do"
	ctl: end:   "done"
}

Until :: ctl & {
	ctl: start: "until"
	ctl: then:  "do"
	ctl: end:   "done"
}

Switch :: Command & {
	test: Arg
	case: [string]: Command | [...Command]

	_eval: """
		case \(test & string | test.output) in
		\(_inner)
		esac
		"""

	_case: [string]: [...Command]
	for pat, body in case {
		_case: "\(pat)": [ (body & Command)] | body
	}

	_inner = strings.Join( [ """
		\(pat))
		\(strings.Join([ b._eval for b in body ], "\n"))
		;;
		""" for pat, body in _case ], "\n")
}
