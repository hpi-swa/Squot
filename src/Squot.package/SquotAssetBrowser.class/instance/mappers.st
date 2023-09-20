accessing
mappers
	^ (self activeWorkingCopy ifNil: [^ {}]) mappersOfKind: SquotAssetMapper