accessing
setText: aText
	self mapper
		transformAndMaterializeAsset: aText asString
		in: self workingCopy
		ifFail: [].