accessing
mappers
	^ (self activeWorkingCopy ifNil: [^ {}]) mappersOfKind: GSAssetMapper