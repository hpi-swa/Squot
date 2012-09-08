processing
unpack
	| baseOffset base interpreter |
	(self pack hasIndexFile not
	and: [ (self pack repository hasLooseObject: self deltaBaseName) not ]) ifTrue: [ ^ self ].

	interpreter := self loadDeltaInterpreter.
	self runDeltaInterpreter: interpreter against: self deltaBase