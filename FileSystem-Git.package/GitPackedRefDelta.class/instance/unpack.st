processing
unpack
	| hexHash interpreter base |
	hexHash := (file next: 20) asHexHash.
	packedLength := packedLength + 20.
	interpreter := self loadDeltaInterpreter.
	base := self pack objectNamed: hexHash.
	self runDeltaInterpreter: interpreter against: base