ansi gettable
next: number into: aCollection
	| pos |
	isBinary ifTrue: [^ self basicNext: number into: aCollection].
	pos := 1.
	number timesRepeat: [aCollection at: pos put: (self converter nextFromStream: self)]