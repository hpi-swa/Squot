comparing
hashWithInitialHash: speciesHash
	| hash stream character |
	hash := speciesHash bitAnd: 16r0FFFFFFF.
	stream := self readStream.
	[stream atEnd] whileFalse: [
		character := (self peekForNewLine: stream) ifTrue: [Character cr] ifFalse: [stream next].
		hash := (hash + character asInteger) hashMultiply].
	^ hash