delegate
nodeAt: aPath ifPresent: presentBlock ifAbsent: absentBlock
	self ensure: aPath.
	^ cacheStore
		nodeAt:  aPath
		ifPresent: presentBlock
		ifAbsent: absentBlock