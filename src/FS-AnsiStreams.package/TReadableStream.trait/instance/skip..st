ansi gettable
skip: anInteger
	anInteger timesRepeat:
		[self atEnd ifTrue: [^ self].
		self next].