private
findBinary: anInteger from: lowerBound to: upperBound
	| index low high |
	low := lowerBound.
	high := upperBound.
	[ index := high + low // 2. low > high ] whileFalse: [ | test |
		hashStream position: index * 20.
		test := (hashStream next: 20) asInteger.
		test = anInteger 
			ifTrue: [ ^ index ]
			ifFalse: [ anInteger > test
				ifTrue: [  low := index + 1 ]
				ifFalse: [ high := index - 1 ] ] ].
	self flag: 'throw an exception here instead of answering nil'.
	^ nil