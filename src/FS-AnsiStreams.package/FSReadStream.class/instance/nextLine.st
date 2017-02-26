ansi gettable
nextLine
	| char lineSeparators |
	lineSeparators := Array with: 10 with: 13 with: Character lf with: Character cr.
	^ (isBinary ifTrue: ByteArray ifFalse: String) streamContents:
		[:out |
		[self atEnd or: [lineSeparators includes: (char := self next)]] whileFalse: [out nextPut: char].
		(self atEnd not and: [char asInteger = 13] and: [self peek asInteger = 10]) ifTrue: [position := position + 1]].
	