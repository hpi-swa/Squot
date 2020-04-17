accessing-objects
looseObjectNamed: aHexHash ifAbsent: aBlock
	| stream object |
	self privateDeprecatedUseUnitOfWork.
	stream :=
		self 
			streamLooseObjectNamed: aHexHash
			ifAbsent: [ ^ aBlock value ].
	[object := GitStorableObject 
		fromLooseObjectStream: stream
		in: self]
	ensure: [stream close].
	self assert: (objectCache at: object hexHash ifAbsentPut: [object]) = object.
	^ object