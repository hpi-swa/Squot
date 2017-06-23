reading and writing
readFromFile
	| hexHash refName |
	packedRefsFile exists ifFalse: [^ self].
	refsDictionary := Dictionary new.
	packedRefsFile readStreamDo: [:stream |
		stream text.
		[stream atEnd] whileFalse:
			[stream peek = $#
				ifTrue: [stream upTo: Character lf]
				ifFalse: [
					hexHash := stream upTo: Character space.
					refName := stream upTo: Character lf.
					refsDictionary add: (GitReference name: refName target: hexHash)]]]