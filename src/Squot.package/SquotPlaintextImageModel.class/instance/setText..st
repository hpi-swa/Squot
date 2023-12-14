accessing
setText: aText
	self mapper
		transformAndMaterializeVersion: aText asString
		in: self workingCopy
		ifFail: [].