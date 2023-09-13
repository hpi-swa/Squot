*Squot-Mapper
squotCopyWithSources: aCollection notifying: requestor ifFail: aBlock
	^ self class categories: (aCollection first lines collect: #withBlanksTrimmed thenSelect: #notEmpty)