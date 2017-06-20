Squot-diff-converting
asSquotSlotDiffWithKey: aKey
	self squotHasChanges ifFalse: [^ SquotDiffOfEqualObjects instance].
	^ SquotSlotReassignment key: aKey value: self left -> self right