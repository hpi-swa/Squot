running
tearDown
	handle ifNotNil: [handle close].
	reference ifNotNil: [reference delete].