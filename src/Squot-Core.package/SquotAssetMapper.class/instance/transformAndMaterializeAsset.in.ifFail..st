ui
transformAndMaterializeAsset: anAsset in: aWorkingCopy ifFail: aBlock
	self materializeAsset: (self transformAsset: anAsset ifFail: [^ aBlock value]) in: aWorkingCopy.