package sh

import "strings"

Scope: Command & {
	list: [...Command]
	_eval: """
		{
		\(_list)
		}
		"""
	_list = strings.Join([ x._eval for x in list ], "\n")
}
