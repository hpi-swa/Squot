Squot-diff-converting
asSquotSlotDiffWithKey: aKey
	self squotHasChanges ifFalse: [^ SquotDiffOfEqualObjects instance].
	^ SquotSlotReassignment key: aKey leftShadow: self left rightShadow: self right