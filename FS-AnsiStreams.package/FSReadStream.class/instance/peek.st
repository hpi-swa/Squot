ansi gettable
peek
	| oldPosition |
	isBinary ifTrue: [^ handle at: position].
	oldPosition := position.
	^ [self converter nextFromStream: self] ensure: [position := oldPosition]