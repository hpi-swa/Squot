accessing-objects
looseObjectNamed: aHexHash ifAbsent: aBlock
	| stream object |
	stream :=
		self 
			streamLooseObjectNamed: aHexHash
			ifAbsent: [ ^ aBlock value ].
	[object := GitStorableObject 
		fromLooseObjectStream: stream
		in: self]
	ensure: [stream close].
	^ objectCache at: object hexHash put: object