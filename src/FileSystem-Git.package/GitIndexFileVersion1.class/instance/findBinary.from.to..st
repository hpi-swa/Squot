private
findBinary: anInteger from: lowerBound to: upperBound
	| index low high |
	low := lowerBound.
	high := upperBound.
	self readStreamDo: [:stream |
		[index := high + low // 2. low > high] whileFalse: [ | test offset |
			"4 bytes index into offset table, 20 bytes"
			stream position: index * 24 + self hashStreamStart.
			offset := stream next: 4.
			test := (stream next: 20) asInteger.
			test = anInteger 
				ifTrue: [^ offset asInteger]
				ifFalse: [anInteger > test
							ifTrue: [low := index + 1]
							ifFalse: [high := index - 1]]]].
	self flag: 'throw an exception here instead of answering nil'.
	^ nil