compatibility
keysAndValuesDo: binaryBlock
	self flag: #compatibility. "Only used during transition from Dictionary. Remove when no longer needed"
	^ self hashesWithObjectsDo: binaryBlock