private
findBinary: anInteger from: lowerBound to: upperBound
	| index low high |
	low := lowerBound.
	high := upperBound.
	self readStreamDo: [:stream |
		[index := high + low // 2. low > high] whileFalse: [ | test |
			stream position: index * 20 + self hashStreamStart.
			test := (stream next: 20) asInteger.
			test = anInteger 
				ifTrue: [^ index]
				ifFalse: [anInteger > test
					ifTrue: [low := index + 1]
					ifFalse: [high := index - 1]]]].
	self flag: 'throw an exception here instead of answering nil'.
	^ nil