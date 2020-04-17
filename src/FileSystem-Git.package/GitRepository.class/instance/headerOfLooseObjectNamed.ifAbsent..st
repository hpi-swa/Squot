accessing-objects
headerOfLooseObjectNamed: aHexHash ifAbsent: aBlock
	| stream |
	self privateDeprecatedUseUnitOfWork.
	stream :=
		self 
			streamLooseObjectNamed: aHexHash
			ifAbsent: [ ^ aBlock value ].
	^ GitStorableObjectHeader 
		fromLooseObjectStream: stream
		in: self