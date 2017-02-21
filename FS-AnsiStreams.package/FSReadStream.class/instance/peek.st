ansi gettable
peek
	| oldPosition |
	self atEnd ifTrue: [^ nil].
	isBinary ifTrue: [^ handle at: position].
	oldPosition := position.
	^ [self converter nextFromStream: self] ensure: [position := oldPosition]