private
looseObjectNamed: aHexHash ifAbsent: aBlock
	| stream object |
	stream :=
		self 
			streamLooseObjectNamed: aHexHash
			ifAbsent: [ ^ aBlock value ].
	[object := GitStorableObject 
		fromLooseObjectStream: stream
		in: repository]
	ensure: [stream close].
	^ object