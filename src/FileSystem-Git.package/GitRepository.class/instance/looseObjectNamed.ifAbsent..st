enumerating
looseObjectNamed: aHexHash ifAbsent: aBlock
	| stream |
	stream :=
		self 
			streamLooseObjectNamed: aHexHash
			ifAbsent: [ ^ aBlock value ].
	^ GitStorableObject 
		fromLooseObjectStream: stream
		in: self