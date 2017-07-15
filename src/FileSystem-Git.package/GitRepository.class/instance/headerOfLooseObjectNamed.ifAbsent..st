accessing-objects
headerOfLooseObjectNamed: aHexHash ifAbsent: aBlock
	| stream |
	stream :=
		self 
			streamLooseObjectNamed: aHexHash
			ifAbsent: [ ^ aBlock value ].
	^ GitStorableObjectHeader 
		fromLooseObjectStream: stream
		in: self