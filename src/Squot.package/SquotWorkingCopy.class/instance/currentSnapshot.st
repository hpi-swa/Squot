private
currentSnapshot
	^ snapshotBlock
		ifNil: [self lazySnapshot]
		ifNotNil: [snapshotBlock value]