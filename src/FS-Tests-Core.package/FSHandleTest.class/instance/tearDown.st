running
tearDown
	handle ifNotNil: [handle isOpen ifTrue: [handle close]].
	reference ifNotNil: [reference delete].