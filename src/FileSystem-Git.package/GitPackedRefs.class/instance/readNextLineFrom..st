reading and writing
readNextLineFrom: aStream 
	| hexHash refName |
	aStream peek = $#
		ifTrue: [aStream upTo: Character lf.
				^ self].
	hexHash := aStream upTo: Character space.
	refName := aStream upTo: Character lf.
	(hexHash first = $^ and: [refName isEmpty]) ifTrue:
		["peeled ref, currently not supported"
		^ self].
	refsDictionary add: (GitReference name: refName target: hexHash).