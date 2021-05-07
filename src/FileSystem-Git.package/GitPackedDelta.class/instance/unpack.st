processing
unpack
	| interpreter |
	(self pack hasIndexFile not
	and: [ (self pack repository unitOfWork hasObject: self deltaBaseName) not ]) ifTrue: [ ^ self ].

	interpreter := self loadDeltaInterpreter.
	self runDeltaInterpreter: interpreter against: self deltaBase