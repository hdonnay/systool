package cmd

gsettings:: cmd & {
	schema: string
	key: string
	value: string
	V = value

	exe: "gsettings"
	argv: [
		"set",
		qstring&{value: schema},
		qstring&{value: key},
		dstring&{value: V},
	]
}
