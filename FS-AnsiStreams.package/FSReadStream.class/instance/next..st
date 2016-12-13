ansi gettable
next: count
	isBinary ifTrue: [^ self basicNext: count].
	^ String streamContents: [:result |
		count timesRepeat: [result nextPut: (self converter nextFromStream: self)]]